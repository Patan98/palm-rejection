# palm-rejection

![BANNER](https://github.com/Patan98/palm-rejection/assets/159428129/b9e8ab5a-c403-4b5e-93e4-970cccfaeaf3)

## Surface pro (not only) Xournalpp useful

Simple pure bash script to have palm rejection actually working.
Some 2-in-1 devices and x86 tablets have built-in palm rejection, others do not.
As in my case of the surface pro 1, which does not have one working on ubuntu and derivatives.
I guess it's the same thing at least with the surface pro 2 because they share a lot of hardware.
Mainly useful for office programs and notes.
Some programs like xournalpp have built in this function but, at least for me it worked really badly.
When I activated pal rejection on xournalpp I had a half second delay from when the pen detached from the screen to when the touch screen actually started working again.
Disable the xournal feature and use this.

### Important
Replace:
'MICROSOFT SAM Stylus Pen (0)' with your pen <br />
and <br />
'Atmel Atmel maXTouch Digitizer' with your screen <br />
<br />
You can find both in xinput command.


#### Bash 
```
DISABLED=0
while true
do
    if [ "$(xinput --query-state 'MICROSOFT SAM Stylus Pen (0)' | grep Proximity= | sed 's/.*Proximity=//')" == "In" ];
    then
        echo "RILEVATO!"
        if [ "$DISABLED" == "0" ];
        then
            xinput disable 'Atmel Atmel maXTouch Digitizer'
            DISABLED=1
        fi
    else
        echo "non rilevato"
        if [ "$DISABLED" == "1" ];
        then
            xinput enable 'Atmel Atmel maXTouch Digitizer'
            DISABLED=0
        fi
    fi
    echo "-------------------------"
    sleep 0.1
done
```
