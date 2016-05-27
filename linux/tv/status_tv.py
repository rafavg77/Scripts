import cec

cec.init()
tv = cec.Device(0)
cui = tv.is_on()
print cui
