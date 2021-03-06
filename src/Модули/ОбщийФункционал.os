Функция УбратьРасширениеИзИмени(Имя, Расширение = ".xml") Экспорт
	Возврат СтрЗаменить(Имя, Расширение, "");	
КонецФункции

Функция ПроверитьНаличиеПредкаВДереве(ТекущийУзел, ИмяРодителя, ИмяПоля = "Имя")  Экспорт
	
	Если ЗначениеЗаполнено(ТекущийУзел.Родитель) Тогда		
		Если ТекущийУзел.Родитель[ИмяПоля] = ИмяРодителя Тогда
			Возврат Истина;
		Иначе
			Возврат ПроверитьНаличиеПредкаВДереве(ТекущийУзел.Родитель, ИмяРодителя);	
		КонецЕсли;
	КонецЕсли;
	
	Возврат Ложь;
	
КонецФункции

Функция ПолучитьСтруктуруДереваПравил() Экспорт
	
	// КЧ = Новый КвалификаторыЧисла(5);
	// МассивТипов = Новый Массив;
	// МассивТипов.Добавить(КЧ);
	
	// Дерево = Новый ДеревоЗначений;
	// Дерево.Колонки.Добавить("Имя"); 
	// Дерево.Колонки.Добавить("Идентификатор");
	// Дерево.Колонки.Добавить("Значение");
	// Дерево.Колонки.Добавить("Порядок", Новый ОписаниеТипов(МассивТипов));
	// Дерево.Колонки.Добавить("ТипСтроки");
	// Дерево.Колонки.Добавить("Каталог");
	// Дерево.Колонки.Добавить("Содержимое");
	// Возврат Дерево;
	
	Дерево = Новый ДеревоЗначений;
	Дерево.Колонки.Добавить("Имя"); 
	Дерево.Колонки.Добавить("Идентификатор");
	Дерево.Колонки.Добавить("Значение");
	Дерево.Колонки.Добавить("Порядок");
	Дерево.Колонки.Добавить("ТипСтроки");
	Дерево.Колонки.Добавить("Каталог");
	//Дерево.Колонки.Добавить("Содержимое");
	Возврат Дерево;
	
КонецФункции

Функция ЭтоXMLФайл(Имя) Экспорт
	
	Возврат СтрЧислоВхождений(Имя, ".xml") > 0;
	
КонецФункции

Функция ПолучитьПараметрыПравил() Экспорт
	
	СтруктураНастроек = Новый Структура;
	
	ИменаРеквизитовКонвертации = Новый Массив;
	
	//Реквизиты конвертации
	ИменаРеквизитовКонвертации.Добавить("ВерсияФормата");
	ИменаРеквизитовКонвертации.Добавить("Ид");
	ИменаРеквизитовКонвертации.Добавить("Наименование");
	ИменаРеквизитовКонвертации.Добавить("ДатаВремяСоздания");	
	ИменаРеквизитовКонвертации.Добавить("Источник");
	ИменаРеквизитовКонвертации.Добавить("Приемник");
	
	СтруктураНастроек.Вставить("ИменаРеквизитовКонвертации", ИменаРеквизитовКонвертации);
	
	ИменаСвойствКонвертации = Новый Массив;
	ИменаСвойствКонвертации.Добавить("Параметры");
	ИменаСвойствКонвертации.Добавить("Обработки");
	
	СтруктураНастроек.Вставить("ИменаСвойствКонвертации", ИменаСвойствКонвертации);
	
	ИменаСвойствГрупп = Новый Массив;
	ИменаСвойствГрупп.Добавить("Группа");
	ИменаСвойствГрупп.Добавить("Параметры");
	ИменаСвойствГрупп.Добавить("Обработки");
	ИменаСвойствГрупп.Добавить("Свойства");	
	ИменаСвойствГрупп.Добавить("Алгоритмы");
	ИменаСвойствГрупп.Добавить("Запросы");	
	
	СтруктураНастроек.Вставить("ИменаСвойствГрупп", ИменаСвойствГрупп);
	
	МассивОбработчиков = Новый Массив;
	
	//Конвертация
	МассивОбработчиков.Добавить("ПослеЗагрузкиПравилОбмена");
	МассивОбработчиков.Добавить("ПередВыгрузкойДанных");
	МассивОбработчиков.Добавить("ПередПолучениемИзмененныхОбъектов");
	МассивОбработчиков.Добавить("ПослеВыгрузкиДанных");
	МассивОбработчиков.Добавить("ПередВыгрузкойОбъекта");
	МассивОбработчиков.Добавить("ПослеВыгрузкиОбъекта");
	МассивОбработчиков.Добавить("ПередКонвертациейОбъекта");
	МассивОбработчиков.Добавить("ПередОтправкойИнформацииОбУдалении");
	МассивОбработчиков.Добавить("ПередЗагрузкойДанных");
	МассивОбработчиков.Добавить("ПослеЗагрузкиДанных");
	МассивОбработчиков.Добавить("ПередЗагрузкойОбъекта");
	МассивОбработчиков.Добавить("ПослеЗагрузкиОбъекта");
	МассивОбработчиков.Добавить("ПриПолученииИнформацииОбУдалении");
	МассивОбработчиков.Добавить("ПослеЗагрузкиПараметров");
	МассивОбработчиков.Добавить("ПослеПолученияИнформацииОбУзлахОбмена");
	
	//ГруппаСвойств
	МассивОбработчиков.Добавить("ПередОбработкойВыгрузки");
	МассивОбработчиков.Добавить("ПередВыгрузкойСвойства");
	МассивОбработчиков.Добавить("ПриВыгрузкеСвойства");
	МассивОбработчиков.Добавить("ПослеВыгрузкиСвойства");
	МассивОбработчиков.Добавить("ПослеОбработкиВыгрузки");
	
	//Свойства
	МассивОбработчиков.Добавить("ПередВыгрузкойСвойства");
	МассивОбработчиков.Добавить("ПриВыгрузкеСвойства");
	МассивОбработчиков.Добавить("ПослеВыгрузкиСвойства");
	
	//ПравилаВыгрузкиДанных
	МассивОбработчиков.Добавить("ПередОбработкойПравила");
	МассивОбработчиков.Добавить("ПослеОбработкиПравила");
	МассивОбработчиков.Добавить("ПередВыгрузкойОбъекта");
	МассивОбработчиков.Добавить("ПослеВыгрузкиОбъекта");
	
	//ПравилаКонвертацииОбъектов
	МассивОбработчиков.Добавить("ПередВыгрузкой");
	МассивОбработчиков.Добавить("ПриВыгрузке");
	МассивОбработчиков.Добавить("ПослеВыгрузки");
	МассивОбработчиков.Добавить("ПослеВыгрузкиОбъектаВФайл");
	МассивОбработчиков.Добавить("ПослеЗагрузки");
	МассивОбработчиков.Добавить("ПослеВыгрузкиВФайл");
	МассивОбработчиков.Добавить("ПередЗагрузкой");
	МассивОбработчиков.Добавить("ПриЗагрузке");
	
	МассивОбработчиков.Добавить("ПередЗагрузкойОбъекта");
	МассивОбработчиков.Добавить("ПриЗагрузкеОбъекта");
	МассивОбработчиков.Добавить("ПослеЗагрузкиОбъекта");
	МассивОбработчиков.Добавить("ПоследовательностьПолейПоиска");
	
	//ПравилаРегистрацииОбъектов
	МассивОбработчиков.Добавить("ПередОбработкой");
	МассивОбработчиков.Добавить("ПриОбработке");
	МассивОбработчиков.Добавить("ПриОбработкеДополнительный");
	МассивОбработчиков.Добавить("ПослеОбработки");
	
	//ПравилаОчисткиОбъектов
	МассивОбработчиков.Добавить("ПередОбработкойПравила");
	МассивОбработчиков.Добавить("ПередУдалениемОбъекта");
	МассивОбработчиков.Добавить("ПослеОбработкиПравила");
	
	//Параметры
	МассивОбработчиков.Добавить("ПослеЗагрузкиПараметра");
	
	СтруктураНастроек.Вставить("ИменаСобытийКонвертации", МассивОбработчиков);
	
	//Исключения для выгрузки в XML
	ИменаИсключений = Новый Массив;
	ИменаИсключений.Добавить("Правило");
	ИменаИсключений.Добавить("Запрос");
	ИменаИсключений.Добавить("Свойства");
	ИменаИсключений.Добавить("Свойство");
	ИменаИсключений.Добавить("Параметр");
	ИменаИсключений.Добавить("Значения");
	ИменаИсключений.Добавить("Значение");
	ИменаИсключений.Добавить("Алгоритм");
	ИменаИсключений.Добавить("Группа");
	ИменаИсключений.Добавить("Текст");
	
	СтруктураНастроек.Вставить("ИменаИсключений", ИменаИсключений);
	
	Возврат СтруктураНастроек; 
	
КонецФункции