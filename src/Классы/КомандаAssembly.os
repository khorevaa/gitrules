///////////////////////////////////////////////////////////////////////////////
//
// Служебный модуль с реализацией работы команды
//
///////////////////////////////////////////////////////////////////////////////

Перем Log;

Процедура НастроитьКоманду(Знач Команда, Знач Парсер) Экспорт

	Парсер.ДобавитьПозиционныйПараметрКоманды(Команда, "КаталогИсходников", "Путь к каталогу распакованных правил конвертации");
	Парсер.ДобавитьПозиционныйПараметрКоманды(Команда, "КаталогСборки", "Путь к каталогу сборки правил конвертации");

КонецПроцедуры // НастроитьКоманду

// Выполняет логику команды
// 
// Параметры:
//   ПараметрыКоманды - Соответствие - Соответствие ключей командной строки и их значений
//   Приложение - Модуль - Модуль менеджера приложения
//
Функция ВыполнитьКоманду(Знач ПараметрыКоманды, Знач Приложение) Экспорт
	
	Log = Приложение.ПолучитьЛог();
	КаталогИсходников = ПараметрыКоманды["КаталогИсходников"];
	ФайлКаталог = Новый Файл(КаталогИсходников);
	Если Не ФайлКаталог.Существует() Или ФайлКаталог.ЭтоФайл() Тогда
		Log.Ошибка("Каталог исходников правил конвертации " + КаталогИсходников + " не существует");
		Возврат Приложение.РезультатыКоманд().НеверныеПараметры;
	КонецЕсли;

	КаталогСборки = ПараметрыКоманды["КаталогСборки"];
	ФайлКаталог = Новый Файл(КаталогСборки);
	Если Не ФайлКаталог.Существует() Или ФайлКаталог.ЭтоФайл() Тогда
		Log.Ошибка("Каталог сборки правил конвертации " + КаталогСборки + " не существует");
		Возврат Приложение.РезультатыКоманд().НеверныеПараметры;
	КонецЕсли;

	МенеджерПравил = Новый ОбработкаПравил();
	МенеджерПравил.СобратьПравилаКонвертации(КаталогИсходников, КаталогСборки);

	Возврат Приложение.РезультатыКоманд().Успех;
	
КонецФункции // ВыполнитьКоманду
