
Перем КлассыПолученияДанных;
Перем КешПутейКлассов;

Функция ПолучитьФайл(Знач ИмяФайла, ИмяКлассаПолучения, КорневаяПапка = "") Экспорт

	Если ЕстьКлассПолучения(ИмяКлассаПолучения) Тогда
		Возврат ПолучитьПутьИзКласса(ИмяФайла, ИмяКлассаПолучения);
	КонецЕсли;

	Возврат ОбъединитьПути(КорневаяПапка, ИмяФайла);
	
КонецФункции

Функция ПолучитьПутьИзКласса(Знач ИмяФайла, ИмяКлассаПолучения) Экспорт

	КлючКеша = СтрШаблон("%1_%2", ИмяКлассаПолучения, ИмяФайла);

	ПутьИхКеша = КешПутейКлассов[КлючКеша];

	Если НЕ ПутьИхКеша = Неопределено Тогда
		Возврат ПутьИхКеша;
	КонецЕсли;

	НовыйВременныйФайл = ВременныеФайлы.НовоеИмяФайла();

	ЗаписатьXMLДанныеВФайл(НовыйВременныйФайл, ПолучитьXMLДанныеФайла(ИмяФайла, ИмяКлассаПолучения));

	КешПутейКлассов.Вставить(КлючКеша, НовыйВременныйФайл);

	Возврат НовыйВременныйФайл;
	
КонецФункции

Функция ПолучитьXMLДанныеФайла(ИмяФайла, ИмяКлассаПолучения)
	
	Возврат ИмяКлассаПолучения.ПолучитьДанные(ИмяФайла);

КонецФункции

Процедура ЗаписатьXMLДанныеВФайл(ИмяВременногоФайла, XMLДанныеФайла)
	
	ДанныеХМЛ = XMLЗначение(Тип("Строка"), XMLДанныеФайла);
	
	ЗаписьТекста = Новый ЗаписьТекста(ИмяВременногоФайла);
	ЗаписьТекста.ЗаписатьСтроку(ДанныеХМЛ);
	ЗаписьТекста.Закрыть();

КонецПроцедуры

Функция ЕстьКлассПолучения(ИмяКлассаПолучения)

	ЗначениеКеша = Не КлассыПолученияДанных[ИмяКлассаПолучения];
	КлассДоступен = НЕ ЗначениеКеша = Неопределено;
	Если ЗначениеКеша = Неопределено Тогда
		
		КлассДоступен = Ложь;
		Попытка
			КлассПолучения = Новый ("bindata_"+ИмяКлассаПолучения);
			КлассДоступен = Истина;
		Исключение

		КонецПопытки;

		Если КлассДоступен Тогда
			КлассыПолученияДанных.Вставить(ИмяКлассаПолучения, КлассПолучения);
		КонецЕсли;

	КонецЕсли;

	Возврат КлассДоступен;

КонецФункции

Функция ПрочитатьФайлВДвоичныеДанные(Знач ПутьКФайлу)

	Данные = Новый ДвоичныеДанные(ПутьКФайлу);
	//Поток = Данные.ОткрытьПотокДляЧтения();
//	Чтение = Новый ЧтениеДанных(ПутьКФайлу, "UTF8", , , );
//	Сообщить(Чтение);
	//ДанныеВБайтах = Поток.Прочитать(); //ПрочитатьСтроку
	СтрокаДанных = XMLСтрока(Данные);

	ЗначениеИЗСтроки = XMLЗначение(Тип("ДвоичныеДанные"), СтрокаДанных);


	Сообщить(СтрокаДанных);
	Сообщить(ЗначениеИЗСтроки);

	
КонецФункции

КлассыПолученияДанных = Новый Соответствие;

ПрочитатьФайлВДвоичныеДанные("./src/Модули/bindata.os");