from pathlib import Path
import shutil

BASE_DIR = Path(__file__).parent

# İlk çalıştırmada True kalsın.
# Sadece ne yapacağını gösterir, dosya silmez.
# Her şey doğru görünüyorsa False yapıp tekrar çalıştır.
DRY_RUN = False

# İşlemden sonra boş watermark klasörünü silsin mi?
REMOVE_EMPTY_WATERMARK_FOLDER = True

# İşlenecek ürün klasörleri
PRODUCT_FOLDERS = [
    "ahsap-jaluzi",
    "al-jaluzi",
    "deri-jaluzi",
    "dikey-perde",
    "fon-perde",
    "ikili-perde",
    "karisik",
    "plise-perde",
    "rustik",
    "screen",
    "stor-perde",
    "tul-perde",
    "zebra-perde",
]


def delete_item(path: Path):
    if DRY_RUN:
        print(f"  [SİLİNECEK] {path}")
        return

    if path.is_dir():
        shutil.rmtree(path)
    else:
        path.unlink()


def move_item(source: Path, target: Path):
    if DRY_RUN:
        print(f"  [TAŞINACAK] {source} -> {target}")
        return

    shutil.move(str(source), str(target))


def process_product_folder(folder: Path):
    watermark_dir = folder / "watermark"

    if not folder.exists() or not folder.is_dir():
        print(f"\n[ATLANDI] Klasör yok: {folder.name}")
        return

    if not watermark_dir.exists() or not watermark_dir.is_dir():
        print(f"\n[ATLANDI] Watermark klasörü yok: {folder.name}")
        return

    watermark_items = list(watermark_dir.iterdir())

    if not watermark_items:
        print(f"\n[ATLANDI] Watermark klasörü boş: {folder.name}")
        return

    print(f"\nİşleniyor: {folder.name}")

    # Ürün klasöründeki watermark hariç her şeyi sil
    for item in folder.iterdir():
        if item.name.lower() == "watermark":
            continue

        delete_item(item)

    # Watermark içindekileri ürün klasörüne taşı
    for item in watermark_items:
        target = folder / item.name

        if target.exists():
            print(f"  [UYARI] Hedef zaten var, atlandı: {target}")
            continue

        move_item(item, target)

    # Boş watermark klasörünü sil
    if REMOVE_EMPTY_WATERMARK_FOLDER:
        if DRY_RUN:
            print(f"  [SİLİNECEK] Boş klasör: {watermark_dir}")
        else:
            try:
                watermark_dir.rmdir()
            except OSError:
                print(f"  [UYARI] Watermark klasörü boş değil, silinmedi: {watermark_dir}")


def main():
    print("İşlem başladı.")

    if DRY_RUN:
        print("DRY_RUN aktif. Şu an hiçbir dosya silinmeyecek veya taşınmayacak.")

    for folder_name in PRODUCT_FOLDERS:
        folder = BASE_DIR / folder_name
        process_product_folder(folder)

    print("\nİşlem tamamlandı.")

    if DRY_RUN:
        print("\nGerçek işlem yapmak için kodda şunu değiştir:")
        print("DRY_RUN = False")


if __name__ == "__main__":
    main()