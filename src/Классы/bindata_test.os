﻿#Использовать bindata
// ФАЙЛ СОЗДАН АВТОМАТИЧЕСКИ
// КОРРЕКТИРОВКА В РУЧНУЮ НЕЖЕЛАТЕЛЬНА
Перем СоответствиеФайлов;
 
Функция ПолучитьСписокФайлов() Экспорт
	Возврат СоответствиеФайлов;
КонецФункции

Функция ПолучитьДанные(Знач ИмяФайла) Экспорт

	Возврат СоответствиеФайлов[ИмяФайла];

КонецФункции

Процедура Инициализация()
	СоответствиеФайлов = Новый Соответствие();

	// >>> НАЧАЛО ФАЙЛ test.txt
	СоответствиеФайлов.Вставить(test.txt, "./tests/fixtures/test.txt");
	// <<< КОНЕЦ
	
КонецПроцедуры;

Инициализация();
