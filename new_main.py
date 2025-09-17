import cv2
import numpy as np

def create_ascii_art(image_path, output_file="ASCII_Art.txt", char_set=None, resolution_scale=0.1):
    """
    Создает ASCII-арт из изображения
    
    Args:
        image_path (str): путь к исходному изображению
        output_file (str): имя выходного файла
        char_set (str): набор символов для ASCII-арта
        resolution_scale (float): масштаб уменьшения разрешения (0.0-1.0)
    """
    
    # Набор символов от светлого к темному
    if char_set is None:
        char_set = " `.,-':<>;+!*/?%&98#@"
    
    # Загрузка изображения
    try:
        image = cv2.imread(image_path)
        if image is None:
            raise FileNotFoundError(f"Не удалось загрузить изображение: {image_path}")
    except Exception as e:
        print(f"Ошибка загрузки изображения: {e}")
        return
    
    # Преобразование в оттенки серого
    gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    height, width = gray_image.shape
    
    # Автоматическое определение шага дискретизации на основе масштаба
    x_step = max(1, int(6 * resolution_scale))
    y_step = max(1, int(12 * resolution_scale))
    
    print(f"Размер изображения: {width}x{height} пикселей")
    print(f"Шаг дискретизации: {x_step}x{y_step}")
    print(f"Размер ASCII-арта: {width//x_step}x{height//y_step} символов")
    
    # Вычисление коэффициента преобразования
    coef = 255 / (len(char_set) - 1)
    
    # Создание ASCII-арта
    ascii_art = []
    
    for y in range(0, height, y_step):
        line = ""
        for x in range(0, width, x_step):
            # Получаем значение пикселя
            pixel_value = gray_image[y, x]
            
            # Преобразуем в индекс символа
            char_index = min(len(char_set) - 1, int(pixel_value / coef))
            
            # Добавляем символ в строку
            line += char_set[char_index]
        
        ascii_art.append(line)
    
    # Сохранение в файл
    try:
        with open(output_file, "w", encoding="utf-8") as file:
            file.write("\n".join(ascii_art))
        print(f"ASCII-арт успешно сохранен в файл: {output_file}")
    except Exception as e:
        print(f"Ошибка сохранения файла: {e}")
    
    return ascii_art

def preview_ascii_art(ascii_art, max_lines=20):
    """Предпросмотр ASCII-арта в консоли"""
    print("\n" + "="*50)
    print("ПРЕДПРОСМОТР ASCII-АРТА:")
    print("="*50)
    
    for i, line in enumerate(ascii_art):
        if i < max_lines:
            print(line)
        else:
            print(f"... и еще {len(ascii_art) - max_lines} строк")
            break

# Основная программа
if __name__ == "__main__":
    # Настройки
    INPUT_IMAGE = 'img/img_19.png'  # путь к вашему изображению
    OUTPUT_FILE = "ASCII_Art.txt"
    
    # Создание ASCII-арта
    ascii_result = create_ascii_art(
        image_path=INPUT_IMAGE,
        output_file=OUTPUT_FILE,
        resolution_scale=0.15  # регулируйте качество (0.05-0.3)
    )
    
    # Предпросмотр результата
    if ascii_result:
        preview_ascii_art(ascii_result)