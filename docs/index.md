# rbx-ui
rbx-ui is a user interface toolkit based on [Roact](https://github.com/Roblox/Roact). Its purpose is to provide implementations of common, simple user interface elements to demonstrate Roact's power and flexibility. Elements are designed to support as many Roblox properties as feasible - a rbx-ui element should have an API similar to (though not necessarily exactly equivalent to) a GuiObject, plus some extra properties.

## Installation
To install rbx-ui, you'll need to first install Roact from its repository. Follow the instructions there.

!!! warning
    rbx-ui assumes that you will install Roact in the recommended location of `ReplicatedStorage`. If you choose not to do this, you will need to update the install location in **every** file. This process will change later - keep an eye on [issue #1](https://github.com/AmaranthineCodices/rbx-ui/issues/1) for more info.

Once you've installed Roact, you can install rbx-ui in one of two ways:

### Installation from Release

!!! info
    This method is coming soon - there isn't a current release of rbx-ui yet. Check back later!

Download the `installer.lua` file from the [latest release](https://github.com/AmaranthineCodices/rbx-ui/releases) and run it in Studio (look for "Run Script" in the Test tab). Install rbx-ui anywhere you like - we suggest `ReplicatedStorage.UI`, as this is where the examples assume it is installed.

### Installation from Development
Download the repository and use [Rojo](https://github.com/LPGhatguy/rojo) to synchronize the `src` and `examples` directories to a Studio window. Just run `rojo serve` from a command prompt in the repository's directory, then pull it into Studio.

## Usage
TODO

## Examples
rbx-ui has a bunch of examples. These are used to test elements as they are written, and they also serve as effective demonstrations of the various elements. You can see all the current examples in the `examples` directory of the repository.