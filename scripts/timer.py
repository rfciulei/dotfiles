#! /usr/bin/python3

import os
from time import sleep
from sys import exit
from tqdm import tqdm
import vlc

clearConsole = lambda: os.system('cls' if os.name in ('nt', 'dos') else 'clear')

print('Number of minutes:')

_input = input()

try:
    minutes = int(_input)
except:
    print('Relaunch program and enter a correct number.')
    exit()

total_seconds = minutes * 60 - 15

intervals_to_wait = int(total_seconds / 10)

print('intervals_to_wait' + str())

seconds_waited = 0

clearConsole()

for i in tqdm(range(intervals_to_wait)):
    sleep(10)
    seconds_waited += 10
    time_waited = str(int((total_seconds - seconds_waited) / 60)) + 'm' + str(
        int((total_seconds - seconds_waited) % 60)) + 's'
    print(time_waited)
    clearConsole()

p = vlc.MediaPlayer("./resources/alarm-clock.mp3")

print("TIME UP")

p.play()
sleep(15)
p.stop()
p.play()
sleep(15)
p.stop()
