///////////////////////////////////////////////////////////////////////////////
//
// Служебный модуль с набором служебных параметров приложения
//
// При создании нового приложения обязательно внести изменение 
// в ф-ии ИмяПродукта, указав имя вашего приложения.
//
// При выпуске новой версии обязательно изменить ее значение
// в ф-ии ВерсияПродукта
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// СВОЙСТВА ПРОДУКТА

// ВерсияПродукта
//	Возвращает текущую версию продукта
//
// Возвращаемое значение:
//   Строка   - Значение текущей версии продукта
//
Функция ВерсияПродукта() Экспорт
	
	Возврат "0.2.0";
	
КонецФункции // ВерсияПродукта

// ИмяПродукта
//	Возвращает имя продукта
//
// Возвращаемое значение:
//   Строка   - Значение имени продукта
//
Функция ИмяПродукта() Экспорт
	
	Возврат "gitrules";
	
КонецФункции // ИмяПродукта

///////////////////////////////////////////////////////////////////////////////
// ЛОГИРОВАНИЕ

//	Форматирование логов
//   См. описание метода "УстановитьРаскладку" библиотеки logos
//
Функция Форматировать(Знач Уровень, Знач Сообщение) Экспорт

	Возврат СтрШаблон("%1: %2 - %3", ТекущаяДата(), УровниЛога.НаименованиеУровня(Уровень), Сообщение);

КонецФункции
	
// ИмяЛогаСистемы
//	Возвращает идентификатор лога приложения
//
// Возвращаемое значение:
//   Строка   - Значение идентификатора лога приложения
//
Функция ИмяЛогаСистемы() Экспорт
	
	Возврат "oscript.app." + ИмяПродукта();
	
КонецФункции // ИмяЛогаСистемы

///////////////////////////////////////////////////////////////////////////////
// НАСТРОЙКА КОМАНД

// Возвращает имя команды "version" (ключ командной строки)
//
//  Возвращаемое значение:
//   Строка - имя команды
//
Функция ИмяКомандыВерсия() Экспорт
	
	Возврат "version";

КонецФункции // ИмяКомандыВерсия


// Возвращает имя команды "help" (ключ командной строки)
//
//  Возвращаемое значение:
//   Строка - имя команды
//
Функция ИмяКомандыПомощь() Экспорт

	Возврат "help";
	
КонецФункции // ИмяКомандыПомощь()

// Возвращает имя команды "install" (ключ командной строки)
//
//  Возвращаемое значение:
//   Строка - имя команды
//
Функция ИмяКомандыУстановить() Экспорт

	Возврат "install";
	
КонецФункции // ИмяКомандыУстановить()

// Возвращает имя команды "remove" (ключ командной строки)
//
//  Возвращаемое значение:
//   Строка - имя команды
//
Функция ИмяКомандыУдалить() Экспорт

	Возврат "remove";
	
КонецФункции // ИмяКомандыУдалить()

// Возвращает имя команды "Export" (ключ командной строки)
//
//  Возвращаемое значение:
//   Строка - имя команды
//
Функция ИмяКомандыРазложить() Экспорт

	Возврат "export";
	
КонецФункции // ИмяКомандыРазложить()

// Возвращает имя команды "Assembly" (ключ командной строки)
//
//  Возвращаемое значение:
//   Строка - имя команды
//
Функция ИмяКомандыСобрать() Экспорт

	Возврат "assembly";
	
КонецФункции // ИмяКомандыСобрать()

// НастроитьКомандыПриложения
//	Регистрирует классы обрабатывающие команды прилоложения
// 
// Параметры:
//	Приложение - Модуль - Модуль менеджера приложения
Процедура НастроитьКомандыПриложения(Знач Приложение) Экспорт
	
	Приложение.ДобавитьКоманду(
		ИмяКомандыПомощь(), 
		"КомандаСправкаПоПараметрам", 
		"Справка по командам"
	);

	Приложение.ДобавитьКоманду(
		ИмяКомандыВерсия(), 
		"КомандаVersion", 
		"Версию приложения"
	);

	Приложение.ДобавитьКоманду(
		ИмяКомандыУстановить(), 
		"КомандаInstall", 
		"Установить gitrules в текущий репозиторий"
	);
	
	Приложение.ДобавитьКоманду(
		ИмяКомандыУдалить(), 
		"КомандаRemove", 
		"Удалить gitrules в текущем репозитории"
	);
	
	Приложение.ДобавитьКоманду(
		ИмяКомандыРазложить(), 
		"КомандаExport", 
		"Распаковка правил xml на файлы и каталоги"
	);
	
	Приложение.ДобавитьКоманду(
		ИмяКомандыСобрать(), 
		"КомандаAssembly", 
		"Сборка из каталогов и файлов правил xml"
	);

КонецПроцедуры // ПриРегистрацииКомандПриложения
