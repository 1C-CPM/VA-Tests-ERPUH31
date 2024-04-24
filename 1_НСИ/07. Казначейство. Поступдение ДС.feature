﻿#language: ru

@tree

Функционал: 7. Казначейство. Поступление денежных средств

Как бизнес-аналитик я хочу
проверить работоспособность документа распоряжений
чтобы исключить ошибки при работе с поступдениями дс

Контекст:
	 
	И я подключаю TestClient "ЕРПУХ 3.1 ТЕСТ" логин "Администратор" пароль ""
	И Я закрыл все окна клиентского приложения

Сценарий: 7.1. Поступление оплаты от клиента

	* Формируем необходимые переменные

		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"	

	* Создание документа
	
		И В командном интерфейсе я выбираю 'Казначейство' 'Безналичные платежи'
		Тогда открылось окно 'Безналичные платежи'
		И в таблице "СписокПлатежей" я нажимаю на кнопку 'Поступление оплаты от клиента'
		Тогда открылось окно 'Поступление безналичных денежных средств (создание)'
	
	* Тип документа

		И из выпадающего списка "Тип документа" я выбираю точное значение 'Платежное поручение'
	
	* Номер по банку
	
		И в поле 'Номер по банку' я ввожу текст '1'
	
	* Дата входящего документа
	
		И в поле с именем 'ДатаВходящегоДокумента' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту

	* Плательщик

		И я нажимаю кнопку выбора у поля "Плательщик"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Поступление безналичных денежных средств (создание) *'

	* Счет плательщика

		И я нажимаю кнопку выбора у поля "Счет плательщика"
		И из выпадающего списка "Счет плательщика" я выбираю точное значение '0982 в "НАТИКСИС БАНК АО" (RUB)'

	* Банкоский счет организации	

		И я нажимаю кнопку выбора у поля "Счет"
		Тогда открылось окно 'Банковские счета'
		И в таблице "Список" я перехожу к строке:
			| 'БИК'       | 'Валюта' | 'Наименование'                          | 'Наименование банка'     | 'Номер счета'          | 'Организация' |
			| '044525502' | 'RUB'    | '0677 в "БАНК "МБА-МОСКВА" ООО, Юпитер' | '"БАНК "МБА-МОСКВА" ООО' | '40702810200000000677' | 'Юпитер'      |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Поступление безналичных денежных средств (создание) *'
	
	* Сумма
	
		И в поле с именем 'СуммаДокумента' я ввожу текст '50,00'
	
	* Закладка расшифровка платежа	
	
		И я перехожу к закладке "Расшифровка платежа"
	
	* Структура задолженности
	
		И из выпадающего списка с именем "РасшифровкаБезРазбиенияЭлементСтруктурыЗадолженности" я выбираю точное значение 'Основной долг'

	* Ставка НДС
	
		И из выпадающего списка с именем "РасшифровкаБезРазбиенияСтавкаНДС" я выбираю точное значение '20%'

	* ЦФО
		
		И я нажимаю кнопку выбора у поля с именем "РасшифровкаБезРазбиенияЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Поступление безналичных денежных средств (создание) *'

	* Проект
	
		И я нажимаю кнопку выбора у поля с именем "РасшифровкаБезРазбиенияПроект"
		Тогда открылось окно 'Проекты'
		И в таблице "Список" я перехожу к строке:
			| 'Код'       | 'Наименование'      | 'Проект' |
			| '00-000000' | 'Проект "Ангар 18"' | 'Да'     |
		И в таблице "Список" я выбираю текущую строку

	* Запись и провежение документа
	
		 И я нажимаю на кнопку 'Провести и закрыть'
		 И я жду закрытия окна "Поступление безналичных денежных средств (создание) *" в течение 10 секунд
		 И Я закрываю окно 'Безналичные платежи'
	
Сценарий: 7.2. Поступление оплаты по эквайрингу

	# * Формируем необходимые переменные

		# И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"	

	# * Создание документа
	
		# И В командном интерфейсе я выбираю 'Казначейство' 'Безналичные платежи'
		# Тогда открылось окно 'Безналичные платежи'
		# И в таблице "СписокПлатежей" я нажимаю на кнопку 'Поступление оплаты по эквайрингу'
		# Тогда открылось окно 'Поступление безналичных денежных средств (создание)'
	
	# * Тип документа

		# И из выпадающего списка "Тип документа" я выбираю точное значение 'Платежное поручение'
	
	# * Номер по банку
	
		# И в поле 'Номер по банку' я ввожу текст '1'
	
	# * Дата входящего документа
	
		# И в поле с именем 'ДатаВходящегоДокумента' я ввожу значение переменной "ТекущаяДата"
		# И я перехожу к следующему реквизиту

	# * Эквайер

		# И я нажимаю кнопку выбора у поля "Эквайер"
		# Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		# И в таблице "Список" я перехожу к строке:
			# | 'Наименование' |
			# | 'ООО "Весна"'  |
		# И в таблице "Список" я выбираю текущую строку
		# Тогда открылось окно 'Поступление безналичных денежных средств (создание) *'

	# * Договор эквайринга
	
	

	# * Счет плательщика

		# И я нажимаю кнопку выбора у поля "Счет плательщика"
		# И из выпадающего списка "Счет плательщика" я выбираю точное значение '0982 в "НАТИКСИС БАНК АО" (RUB)'

	# * Банкоский счет организации	

		# И я нажимаю кнопку выбора у поля "Счет"
		# Тогда открылось окно 'Банковские счета'
		# И в таблице "Список" я перехожу к строке:
			# | 'БИК'       | 'Валюта' | 'Наименование'                          | 'Наименование банка'     | 'Номер счета'          | 'Организация' |
			# | '044525502' | 'RUB'    | '0677 в "БАНК "МБА-МОСКВА" ООО, Юпитер' | '"БАНК "МБА-МОСКВА" ООО' | '40702810200000000677' | 'Юпитер'      |
		# И в таблице "Список" я выбираю текущую строку
		# Тогда открылось окно 'Поступление безналичных денежных средств (создание) *'
	
	# * Сумма
	
		# И в поле с именем 'СуммаДокумента' я ввожу текст '50,00'
	
	# * Закладка расшифровка платежа	
	
		# И я перехожу к закладке "Расшифровка платежа"
	
	# * Структура задолженности
	
		# И из выпадающего списка с именем "РасшифровкаБезРазбиенияЭлементСтруктурыЗадолженности" я выбираю точное значение 'Основной долг'

	# * Ставка НДС
	
		# И из выпадающего списка с именем "РасшифровкаБезРазбиенияСтавкаНДС" я выбираю точное значение '20%'

	# * ЦФО
		
		# И я нажимаю кнопку выбора у поля с именем "РасшифровкаБезРазбиенияЦФО"
		# Тогда открылось окно 'Организации'
		# И в таблице "Список" я перехожу к строке:
			# | 'Рабочее наименование' |
			# | 'Юпитер'               |
		# И в таблице "Список" я выбираю текущую строку
		# Тогда открылось окно 'Поступление безналичных денежных средств (создание) *'

	# * Проект
	
		# И я нажимаю кнопку выбора у поля с именем "РасшифровкаБезРазбиенияПроект"
		# Тогда открылось окно 'Проекты'
		# И в таблице "Список" я перехожу к строке:
			# | 'Код'       | 'Наименование'      | 'Проект' |
			# | '00-000000' | 'Проект "Ангар 18"' | 'Да'     |
		# И в таблице "Список" я выбираю текущую строку

	# * Запись и провежение документа
	
		 # И я нажимаю на кнопку 'Провести и закрыть'
		 # И я жду закрытия окна "Поступление безналичных денежных средств (создание) *" в течение 10 секунд
		 # И Я закрываю окно 'Безналичные платежи'

Сценарий: 7.3. Поступление от другой организации
Сценарий: 7.4.Передача между организацией и филиалом
Сценарий: 7.5.Поступление с другого счета
Сценарий: 7.6.Инкассация в банк
Сценарий: 7.7.Поступление по кредитам и займам полученным
Сценарий: 7.9.Погашение займа контрагентом
Сценарий: 7.10.Погашение займа сотрудником
Сценарий: 7.11.Конвертация валюты
Сценарий: 7.12.Прочее поступление
Сценарий: 7.13.Возврат от поставщика
Сценарий: 7.14.Возврат от подотчетника
Сценарий: 7.15.Возврат от другой организации
Сценарий: 7.16.Возврат от арендодателя
Сценарий: 7.17.Возврат неперечисленной зарплаты на лицевые счета
Сценарий: 7.18.Возврат зарплаты по зарплатному проекту
