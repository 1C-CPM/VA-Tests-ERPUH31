﻿#language: ru
@tree

@ERPUH31_NSI

Функционал: 4. Планирование и лимитирование. Планируемые доходы

	Как Консультант я хочу
	проверить раоботоспособнось планов и контролей при разных настройках
	чтобы исключить ошибки ввода данных

Контекст:
	И я подключаю TestClient "ЕРПУХ 3.1 ТЕСТ" логин "Администратор" пароль ""
	И Я закрыл все окна клиентского приложения

	И Я запоминаю значение выражения 'Ложь' в переменную "$$ВариантПоискаСтандартный$$"
	И я выполняю код встроенного языка на сервере
	"""bsl
		Объект.ЗначениеНаСервере = Константы.ИспользоватьСтандартныйПоискПриПодбореТоваров.Получить();
	"""
	И я выполняю код встроенного языка
		"""bsl
		КонтекстСохраняемый.ВариантПоискаСтандартный = Ванесса.Объект.ЗначениеНаСервере;
		""" 	

Сценарий: 4.1. Планируемые доходы. Доходы от контрагентов

	И Я запоминаю значение выражения 'Константы.ИспользоватьСтандартныйПоискПриПодбореТоваров.Получить()' в переменную "ВариантПоиска"


	* Открываем раздел планирования, пдланируемый доход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Планируемые доходы'
		Тогда открылось окно 'Планируемые доходы'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Планируемый доход (создание)'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'           |
			| 'Доходы от контрагентов' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание) *'
	
	* Контрагент
	
		И я нажимаю кнопку выбора у поля "Контрагент"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Договор
	
		И я нажимаю кнопку выбора у поля "Договор"
		Тогда открылось окно 'Договоры с контрагентами'
		И в таблице "Список" я перехожу к строке:
			| 'Валюта взаиморасчетов' | 'Вид договора'  | 'Действует по' | 'Действует с' | 'Номер'   | 'Рабочее наименование'  | 'Статус'    |
			| 'RUB'                   | 'С покупателем' | '05.10.2022'   | '05.10.2020'  | 'ПОК_001' | 'ПОК_001 от 05.10.2020' | 'Действует' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'              |
			| 'Операционная деятельность' |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Вид аналитики 1' | 'Доход/Расход' | 'Наименование'               |
			| 'Контрагенты'     | 'Приход'       | 'Прочие операционные доходы' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 1"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 2"
		Тогда открылось окно 'Номенклатура'
	
		Если '$$ВариантПоискаСтандартный$$ = Истина' Тогда 
			И в таблице "СписокСтандартныйПоискНоменклатура" я перехожу к строке:
				| 'Артикул' | 'Наименование'       |
				| 'К-9881'  | 'Кондиционер ELEKTA' |
			И в таблице "СписокСтандартныйПоискНоменклатура" я выбираю текущую строку
		Если '$$ВариантПоискаСтандартный$$ = Ложь' Тогда 
			И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
				| 'Артикул' | 'Наименование'       |
				| 'К-9881'  | 'Кондиционер ELEKTA' |
			И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		
		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Планируемый доход * ООО "Весна"; Доходы от контрагентов' в течение 20 секунд
		
		
Сценарий: 4.2. Планируемые доходы. Доходы от подотчетных лиц

	* Открываем раздел планирования, пдланируемый доход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Планируемые доходы'
		Тогда открылось окно 'Планируемые доходы'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Планируемый доход (создание)'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'              |
			| 'Доходы от подотчетных лиц' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание) *'
	
	* Сотрудник
	
		И я нажимаю кнопку выбора у поля "Сотрудник"
		Тогда открылось окно 'Физические лица'
		И в таблице "Список" я перехожу к строке:
			| 'ФИО'          |
			| 'Гадже Гхале'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание) *'
		
	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'              |
			| 'Операционная деятельность' |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Вид аналитики 1' | 'Доход/Расход' | 'Наименование'               |
			| 'Контрагенты'     | 'Приход'       | 'Прочие операционные доходы' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 1"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 2"
		Тогда открылось окно 'Номенклатура'

		Если '$$ВариантПоискаСтандартный$$ = Истина' Тогда 
			И в таблице "СписокСтандартныйПоискНоменклатура" я перехожу к строке:
				| 'Артикул' | 'Наименование'       |
				| 'К-9881'  | 'Кондиционер ELEKTA' |
			И в таблице "СписокСтандартныйПоискНоменклатура" я выбираю текущую строку
		Если '$$ВариантПоискаСтандартный$$ = Ложь' Тогда 
			И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
				| 'Артикул' | 'Наименование'       |
				| 'К-9881'  | 'Кондиционер ELEKTA' |
			И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку

		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Планируемый доход * ООО "Весна"; Доходы от подотчетных лиц' в течение 20 секунд		
		
Сценарий: 4.3. Планируемые доходы. Доходы по депозитам

	* Открываем раздел планирования, пдланируемый доход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Планируемые доходы'
		Тогда открылось окно 'Планируемые доходы'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Планируемый доход (создание)*'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'        |
			| 'Доходы по депозитам' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание) *'
	
	* Контрагент
	
		И я нажимаю кнопку выбора у поля "Контрагент"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Договор
	
		И я нажимаю кнопку выбора у поля "Договор кредита (депозита)"
		Тогда открылось окно 'Договоры кредитов и депозитов'
		И в таблице "Список" я перехожу к строке:
			| 'Валюта' | 'Вид договора'  | 'Дата'       | 'Контрагент'  | 'Номер'   | 'Оплата в иностранной валюте' | 'Организация' | 'Ответственный' | 'Подразделение'        | 'Последний платеж' | 'Рабочее наименование'  | 'Статус'    |
			| 'RUB'    | 'Заем выданный' | '05.10.2020' | 'ООО "Весна"' | 'ЗаемВыд' | 'Нет'                         | 'Юпитер'      | 'Администратор' | 'Торговое направление' | '05.10.2022'       | 'ЗаемВыд от 05.10.2020' | 'Действует' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                    |
			| 'Доход от процентов по депозитам' |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 1"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Планируемый доход * ООО "Весна"; Доходы по депозитам' в течение 20 секунд	

Сценарий: 4.4. Планируемые доходы. Доходы по кредитам и займам (контрагенты)

	* Открываем раздел планирования, пдланируемый доход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Планируемые доходы'
		Тогда открылось окно 'Планируемые доходы'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Планируемый доход (создание)*'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                              |
			| 'Доходы по кредитам и займам (контрагенты)' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание) *'
	
	* Контрагент
	
		И я нажимаю кнопку выбора у поля "Контрагент"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Договор
	
		И я нажимаю кнопку выбора у поля "Договор"
		Тогда открылось окно 'Договоры с контрагентами'
		И в таблице "Список" я перехожу к строке:
			| 'Валюта взаиморасчетов' | 'Вид договора'  | 'Действует по' | 'Действует с' | 'Номер'   | 'Рабочее наименование'  | 'Статус'    |
			| 'RUB'                   | 'С покупателем' | '05.10.2022'   | '05.10.2020'  | 'ПОК_001' | 'ПОК_001 от 05.10.2020' | 'Действует' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'              |
			| 'Операционная деятельность' |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Вид аналитики 1' | 'Доход/Расход' | 'Наименование'               |
			| 'Контрагенты'     | 'Приход'       | 'Прочие операционные доходы' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 1"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 2"
		Тогда открылось окно 'Номенклатура'

		Если '$$ВариантПоискаСтандартный$$ = Истина' Тогда 
			И в таблице "СписокСтандартныйПоискНоменклатура" я перехожу к строке:
				| 'Артикул' | 'Наименование'       |
				| 'К-9881'  | 'Кондиционер ELEKTA' |
			И в таблице "СписокСтандартныйПоискНоменклатура" я выбираю текущую строку
		Если '$$ВариантПоискаСтандартный$$ = Ложь' Тогда 
			И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
				| 'Артикул' | 'Наименование'       |
				| 'К-9881'  | 'Кондиционер ELEKTA' |
			И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку

		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Планируемый доход * ООО "Весна"; Доходы по кредитам и займам (контрагенты)' в течение 20 секунд		
		
Сценарий: 4.5. Планируемые доходы. Доходы по кредитам и займам (сотрудники)

	* Открываем раздел планирования, пдланируемый доход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Планируемые доходы'
		Тогда открылось окно 'Планируемые доходы'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Планируемый доход (создание)*'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                             |
			| 'Доходы по кредитам и займам (сотрудники)' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание) *'
	
	* Сотрудник
	
		И я нажимаю кнопку выбора у поля "Сотрудник"
		Тогда открылось окно 'Физические лица'
		И в таблице "Список" я перехожу к строке:
			| 'ФИО'          |
			| 'Гадже Гхале'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание) *'
		
	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'              |
			| 'Операционная деятельность' |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Вид аналитики 1' | 'Доход/Расход' | 'Наименование'               |
			| 'Контрагенты'     | 'Приход'       | 'Прочие операционные доходы' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 1"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 2"
		Тогда открылось окно 'Номенклатура'

		Если '$$ВариантПоискаСтандартный$$ = Истина' Тогда 
			И в таблице "СписокСтандартныйПоискНоменклатура" я перехожу к строке:
				| 'Артикул' | 'Наименование'       |
				| 'К-9881'  | 'Кондиционер ELEKTA' |
			И в таблице "СписокСтандартныйПоискНоменклатура" я выбираю текущую строку
		Если '$$ВариантПоискаСтандартный$$ = Ложь' Тогда 
			И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
				| 'Артикул' | 'Наименование'       |
				| 'К-9881'  | 'Кондиционер ELEKTA' |
			И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку

		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Планируемый доход * ООО "Весна"; Доходы по кредитам и займам (сотрудники)' в течение 20 секунд

Сценарий: 4.6. Планируемые доходы. Доходы по ценным бумагам

	* Открываем раздел планирования, пдланируемый доход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Планируемые доходы'
		Тогда открылось окно 'Планируемые доходы'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Планируемый доход (создание)*'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'             |
			| 'Доходы по ценным бумагам' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание) *'
	
	* Ценная бумага
	
		И я нажимаю кнопку выбора у поля "Ценная бумага"
		Тогда открылось окно 'Ценные бумаги'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                  |
			| 'Переводной вексель 20.01.2018' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание) *'

	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'              |
			| 'Операционная деятельность' |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Вид аналитики 1' | 'Доход/Расход' | 'Наименование'               |
			| 'Контрагенты'     | 'Приход'       | 'Прочие операционные доходы' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 1"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 2"
		Тогда открылось окно 'Номенклатура'

		Если '$$ВариантПоискаСтандартный$$ = Истина' Тогда 
			И в таблице "СписокСтандартныйПоискНоменклатура" я перехожу к строке:
				| 'Артикул' | 'Наименование'       |
				| 'К-9881'  | 'Кондиционер ELEKTA' |
			И в таблице "СписокСтандартныйПоискНоменклатура" я выбираю текущую строку
		Если '$$ВариантПоискаСтандартный$$ = Ложь' Тогда 
			И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
				| 'Артикул' | 'Наименование'       |
				| 'К-9881'  | 'Кондиционер ELEKTA' |
			И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку

		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Планируемый доход * ООО "Весна"; Доходы по ценным бумагам' в течение 20 секунд		
		
Сценарий: 4.7. Планируемые доходы. Прочие доходы

	* Открываем раздел планирования, пдланируемый доход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Планируемые доходы'
		Тогда открылось окно 'Планируемые доходы'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Планируемый доход (создание)*'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'  |
			| 'Прочие доходы' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание) *'
	
	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'              |
			| 'Операционная деятельность' |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Вид аналитики 1' | 'Доход/Расход' | 'Наименование'               |
			| 'Контрагенты'     | 'Приход'       | 'Прочие операционные доходы' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Планируемый доход (создание)*'
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 1"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 2"
		Тогда открылось окно 'Номенклатура'

		Если '$$ВариантПоискаСтандартный$$ = Истина' Тогда 
			И в таблице "СписокСтандартныйПоискНоменклатура" я перехожу к строке:
				| 'Артикул' | 'Наименование'       |
				| 'К-9881'  | 'Кондиционер ELEKTA' |
			И в таблице "СписокСтандартныйПоискНоменклатура" я выбираю текущую строку
		Если '$$ВариантПоискаСтандартный$$ = Ложь' Тогда 
			И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
				| 'Артикул' | 'Наименование'       |
				| 'К-9881'  | 'Кондиционер ELEKTA' |
			И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку

		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Планируемый доход * ООО "Весна"; Прочие доходы' в течение 20 секунд		
		