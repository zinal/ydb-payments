-- ydb yql -f scripts/ydb-payments.sql

--DROP TABLE `demo-payments/settings`;
--DROP TABLE `demo-payments/account`;
--DROP TABLE `demo-payments/saldo`;
--DROP TABLE `demo-payments/transaction`;
--DROP TABLE `demo-payments/oporder`;
--DROP TABLE `demo-payments/inbox`;
--COMMIT;

CREATE TABLE `demo-payments/settings`(
  sid Utf8 NOT NULL,
  day Date,
  PRIMARY KEY(sid)
);

CREATE TABLE `demo-payments/account`(
    id String NOT NULL,
    num Utf8,
    name Utf8,
    date_opened Date,
    date_closed Date,
    PRIMARY KEY(id)
) WITH (
   AUTO_PARTITIONING_BY_SIZE = ENABLED,
   AUTO_PARTITIONING_BY_LOAD = ENABLED,
   AUTO_PARTITIONING_PARTITION_SIZE_MB = 100,
   AUTO_PARTITIONING_MIN_PARTITIONS_COUNT = 200,
   AUTO_PARTITIONING_MAX_PARTITIONS_COUNT = 250
);

CREATE TABLE `demo-payments/saldo`(
    day Date NOT NULL,
    acc_id String NOT NULL,
    num_trans UInt32,
    saldo Decimal(22,9),
    turn_dt Decimal(22,9),
    turn_kt Decimal(22,9),
    PRIMARY KEY(day, acc_id)
) WITH (
   AUTO_PARTITIONING_BY_SIZE = ENABLED,
   AUTO_PARTITIONING_BY_LOAD = ENABLED,
   AUTO_PARTITIONING_PARTITION_SIZE_MB = 100,
   AUTO_PARTITIONING_MIN_PARTITIONS_COUNT = 200,
   AUTO_PARTITIONING_MAX_PARTITIONS_COUNT = 250
);

CREATE TABLE `demo-payments/transaction`(
    id String NOT NULL,
    day Date,
    acc_dt String,
    acc_kt String,
    num_dt UInt32,
    num_kt UInt32,
    amount Decimal(22,9),
    reason Utf8,
    state Int32,
    PRIMARY KEY(id)
) WITH (
   AUTO_PARTITIONING_BY_SIZE = ENABLED,
   AUTO_PARTITIONING_BY_LOAD = ENABLED,
   AUTO_PARTITIONING_PARTITION_SIZE_MB = 500,
   AUTO_PARTITIONING_MIN_PARTITIONS_COUNT = 500,
   AUTO_PARTITIONING_MAX_PARTITIONS_COUNT = 600
);

CREATE TABLE `demo-payments/oporder`(
    acc_id String NOT NULL,
    num_trans UInt32,
    PRIMARY KEY(acc_id)
) WITH (
   AUTO_PARTITIONING_BY_SIZE = ENABLED,
   AUTO_PARTITIONING_BY_LOAD = ENABLED,
   AUTO_PARTITIONING_PARTITION_SIZE_MB = 100,
   AUTO_PARTITIONING_MIN_PARTITIONS_COUNT = 200,
   AUTO_PARTITIONING_MAX_PARTITIONS_COUNT = 250
);

CREATE TABLE `demo-payments/inbox`(
    id String NOT NULL,
    acc_dt String,
    num_dt UInt32,
    acc_kt String,
    amount Decimal(22,9),
    reason Utf8,
    PRIMARY KEY(id)
) WITH (
   AUTO_PARTITIONING_BY_SIZE = ENABLED,
   AUTO_PARTITIONING_BY_LOAD = ENABLED,
   AUTO_PARTITIONING_PARTITION_SIZE_MB = 500,
   AUTO_PARTITIONING_MIN_PARTITIONS_COUNT = 500,
   AUTO_PARTITIONING_MAX_PARTITIONS_COUNT = 600
);

-- End Of File