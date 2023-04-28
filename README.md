# Имитация сценария централизованных платежей с использованием СУБД YDB

Приложение имитирует сценарий выполнения централизованных платежей:
* в системе открыто большое количество обычных счетов и два суперсчёта: консолидирующий и распределительный;
* с обычных счетов выполняются транзакции по переводу средств на консолидирующий суперсчёт;
* с распределительного суперсчёта выполняются транзакции по переводу средств на обычные счета;
* периодически выполняется проверка соотношения средств на консолидирующем и распределительном суперсчетах: если средств на консолидирующем оказывается в 4 раза больше, чем на распределительном, то 75% их переводится на распределительный суперсчет.

Состав таблиц:
* `account` - справочник счетов;
* `saldo` - состояния и обороты по счетам;
* `transaction` - операции перевода средств.

Каждый платёж проводится в две транзакции:
* транзакция регистрации: платёж регистрируется в 