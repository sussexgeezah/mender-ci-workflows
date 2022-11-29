#!/usr/bin/env python3
# Copyright 2022 Northern.tech AS
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

INTRODUCTION = "Mender is an open source over-the-air (OTA) software updater for embedded Linux devices. Mender comprises a client running at the embedded device, as well as a server that manages deployments across many devices."

GETTING_STARTED = "To start using Mender, we recommend that you begin with the Getting started section in the Mender documentation: https://docs.mender.io/"

CONNECT_WITH_US = """Connect with us:
* Join the Mender Hub discussion forum: https://hub.mender.io
* Follow us on Twitter: https://twitter.com/mender_io. Please feel free to tweet us questions.
* Fork us on GitHub: https://github.com/mendersoftware
* Create an issue in the bugtracker: https://tracker.mender.io/projects/MEN
* Email us at contact@mender.io: mailto:contact@mender.io
* Connect to the #mender IRC channel on Libera: https://web.libera.chat/?#mender
"""


def print_hello_mender():

    print()
    print("Hello World from the Mender Team!")

    print(r"                          _")
    print(r" _ __ ___   ___ _ __   __| | ___ _ __")
    print(r"| '_ ` _ \ / _ \ '_ \ / _` |/ _ \ '__|")
    print(r"| | | | | |  __/ | | | (_| |  __/ |")
    print(r"|_| |_| |_|\___|_| |_|\__,_|\___|_|")

    print()
    print(INTRODUCTION)

    print()
    print(GETTING_STARTED)

    print()
    print(CONNECT_WITH_US)


if __name__ == "__main__":
    print_hello_mender()
