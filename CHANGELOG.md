## 0.3.0 (2017-08-15)
- Removed plug dependency
- Added reporter for debugging: console and logger
- Added builtin metrics (erlang memory and stats)
- Added min and max datapoints
- Minor fixes.

## 0.2.3 (2017-08-07)
- Fix exometer_init. Now, options changes are kept and passed to report function.

## 0.2.2 (2017-08-04)
- Handle ErlangError when trying to create same Exometer metric twice

## 0.2.1 (2017-08-02)
- Remove lager as direct dependency

## 0.2.0 (2017-08-01)
- Creating cleaner interface for reporters
