# Approaches for making UI (and making custom UI Elements):

## Storyboards
## XIBs
## Programmatic

# Using my XIB on Storyboard

## Remark:
* All Objects must call an init at some point
* Where does a Storyboard call an init?
    * `initWithCoder`
* need to implement this, and this handles the init.
* But: this init loads the class, not from the XIB. What do I need to do?

## Control Flow:
* Storyboard calls UIView's `initWithCoder`, which should load the NIB and add in the XIB

# Using my XIB programmatically
* Two options:
1. custom init that loads the XIB (same principle as above)
2. override the `initWithFrame` method.

### Remarks
* Both approaches seem to use an auxillary "contentView" for the view loaded from the nib.
