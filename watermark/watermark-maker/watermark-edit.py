from PIL import Image, ImageOps
from pathlib import Path
import re

BASE_DIR = Path(__file__).parent
LOGO_PATH = BASE_DIR / "logo.png"

# Arama modu:
# "SUBFOLDERS"      -> Scriptin bulunduğu dizindeki alt klasörlerin içindeki resimleri işler.
# "CURRENT_FOLDER" -> Direkt scriptin bulunduğu klasördeki resimleri işler.
SEARCH_MODE = "CURRENT_FOLDER"

# Çıktı formatı
OUTPUT_FORMAT = "JPEG"
JPG_QUALITY = 88

# Resim küçültme ayarı
MAX_WIDTH = 1600
MAX_HEIGHT = 1600

# Watermark ayarları
LOGO_TARGET_WIDTH = 360

# Logo zaten opaklığı ayarlanmış PNG ise 1.0 kalsın.
LOGO_OPACITY = 1.0

VALID_EXTENSIONS = [".jpg", ".jpeg", ".png", ".webp"]

# İşlenmemesi gereken klasörler
IGNORED_FOLDERS = [
    "watermark",
    "__pycache__",
    ".git",
    ".venv",
    "venv",
]


def slugify(text: str) -> str:
    """
    Klasör adını dosya adına uygun hale getirir.
    Örnek:
    'stor-perde' -> 'stor-perde'
    'tül-perde' -> 'tul-perde'
    """
    text = text.lower().strip()
    text = text.replace("ı", "i").replace("ğ", "g").replace("ü", "u")
    text = text.replace("ş", "s").replace("ö", "o").replace("ç", "c")
    text = re.sub(r"[^a-z0-9]+", "-", text)
    text = text.strip("-")
    return text


def resize_image(image: Image.Image) -> Image.Image:
    """
    Resmi oranını bozmadan küçültür.
    Küçük resimleri büyütmez.
    """
    image.thumbnail((MAX_WIDTH, MAX_HEIGHT), Image.LANCZOS)
    return image


def prepare_logo(logo_original: Image.Image, image_width: int) -> Image.Image:
    """
    Logoyu sabit genişliğe yakın ayarlar.
    Küçük resimlerde ise resmin %35'ini geçmez.
    """
    max_logo_width_for_image = int(image_width * 0.35)
    logo_width = min(LOGO_TARGET_WIDTH, max_logo_width_for_image)

    if logo_width <= 0:
        logo_width = 1

    logo_ratio = logo_width / logo_original.width
    logo_height = int(logo_original.height * logo_ratio)

    if logo_height <= 0:
        logo_height = 1

    logo = logo_original.resize((logo_width, logo_height), Image.LANCZOS)

    if LOGO_OPACITY < 1.0:
        alpha = logo.split()[3]
        alpha = alpha.point(lambda p: int(p * LOGO_OPACITY))
        logo.putalpha(alpha)

    return logo


def add_watermark(image: Image.Image, logo_original: Image.Image) -> Image.Image:
    image = image.convert("RGBA")
    logo = prepare_logo(logo_original, image.width)

    x = (image.width - logo.width) // 2
    y = (image.height - logo.height) // 2

    watermarked = image.copy()
    watermarked.alpha_composite(logo, (x, y))

    return watermarked


def process_folder(folder: Path, logo_original: Image.Image):
    product_slug = slugify(folder.name)
    output_dir = folder / "watermark"
    output_dir.mkdir(exist_ok=True)

    images = [
        file for file in folder.iterdir()
        if (
            file.is_file()
            and file.suffix.lower() in VALID_EXTENSIONS
            and file.name.lower() != LOGO_PATH.name.lower()
        )
    ]

    if not images:
        print(f"\n[ATLANDI] Resim bulunamadı: {folder}")
        return

    print(f"\nKlasör işleniyor: {folder.name}")

    for index, image_path in enumerate(sorted(images), start=1):
        try:
            image = Image.open(image_path)

            # Telefon/kamera fotoğraflarında yan dönme sorununu düzeltir.
            image = ImageOps.exif_transpose(image)

            image = image.convert("RGBA")

            # Önce resmi küçült
            image = resize_image(image)

            # Sonra watermark bas
            watermarked = add_watermark(image, logo_original)

            # Yeni dosya adı
            output_name = f"{product_slug}-{index:03d}.jpg"
            output_path = output_dir / output_name

            # JPG olarak kaydet
            watermarked = watermarked.convert("RGB")
            watermarked.save(
                output_path,
                OUTPUT_FORMAT,
                quality=JPG_QUALITY,
                optimize=True,
                progressive=True
            )

            print(f"  {image_path.name} -> {output_name}")

        except Exception as e:
            print(f"  Hata: {image_path.name} -> {e}")


def main():
    if not LOGO_PATH.exists():
        print(f"Hata: {LOGO_PATH.name} bulunamadı.")
        print(f"{LOGO_PATH.name} dosyasını watermark.py ile aynı klasöre koymalısın.")
        return

    logo_original = Image.open(LOGO_PATH).convert("RGBA")

    if SEARCH_MODE == "CURRENT_FOLDER":
        print("\nMod: Scriptin bulunduğu klasördeki resimler işlenecek.")
        process_folder(BASE_DIR, logo_original)

    elif SEARCH_MODE == "SUBFOLDERS":
        print("\nMod: Scriptin bulunduğu dizindeki alt klasörler işlenecek.")

        for folder in BASE_DIR.iterdir():
            if not folder.is_dir():
                continue

            if folder.name.lower() in IGNORED_FOLDERS:
                continue

            process_folder(folder, logo_original)

    else:
        print("Hata: SEARCH_MODE değeri geçersiz.")
        print('Geçerli değerler: "SUBFOLDERS" veya "CURRENT_FOLDER"')

    print("\nTüm işlem tamamlandı.")


if __name__ == "__main__":
    main()