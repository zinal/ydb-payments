
CREATE TABLE `demo-payments/account`(
    id String,
    num Utf8,
    name Utf8,
    date_open Date,
    date_close Date,
    PRIMARY KEY(id)
) WITH (
   AUTO_PARTITIONING_BY_SIZE = ENABLED,
   AUTO_PARTITIONING_BY_LOAD = ENABLED,
   AUTO_PARTITIONING_PARTITION_SIZE_MB = 100,
   AUTO_PARTITIONING_MIN_PARTITIONS_COUNT = 200,
   AUTO_PARTITIONING_MAX_PARTITIONS_COUNT = 250
);

CREATE TABLE `demo-payments/saldo`(
    acc_id String,
    day Date,
    num_trans Int32,
    saldo Decimal,
    turn_dt Decimal,
    turn_kt Decimal,
    PRIMARY KEY(acc_id, day)
) WITH (
   AUTO_PARTITIONING_BY_SIZE = ENABLED,
   AUTO_PARTITIONING_BY_LOAD = ENABLED,
   AUTO_PARTITIONING_PARTITION_SIZE_MB = 100,
   AUTO_PARTITIONING_MIN_PARTITIONS_COUNT = 200,
   AUTO_PARTITIONING_MAX_PARTITIONS_COUNT = 250
);

CREATE TABLE `demo-payments/transaction`(
    id String,
    day Date,
    acc_dt String,
    num_dt Int32,
    acc_kt String,
    num_kt Int32,
    amount Decimal,
    reason Utf8,
    state Int32,
    PRIMARY KEY(id)
) WITH (
   AUTO_PARTITIONING_BY_SIZE = ENABLED,
   AUTO_PARTITIONING_BY_LOAD = ENABLED,
   AUTO_PARTITIONING_PARTITION_SIZE_MB = 500,
   AUTO_PARTITIONING_MIN_PARTITIONS_COUNT = 200,
   AUTO_PARTITIONING_MAX_PARTITIONS_COUNT = 250
);
