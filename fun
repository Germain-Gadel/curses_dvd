#!/usr/bin/python3

import time
import math
import sys,os
import curses
from random import randint

def init_colour():
    curses.start_color()
    curses.init_pair(1, curses.COLOR_BLACK, curses.COLOR_BLUE)
    curses.init_pair(2, curses.COLOR_BLACK, curses.COLOR_CYAN)
    curses.init_pair(3, curses.COLOR_BLACK, curses.COLOR_GREEN)
    curses.init_pair(4, curses.COLOR_BLACK, curses.COLOR_MAGENTA)
    curses.init_pair(5, curses.COLOR_BLACK, curses.COLOR_RED)
    curses.init_pair(6, curses.COLOR_BLACK, curses.COLOR_WHITE)
    curses.init_pair(7, curses.COLOR_BLACK, curses.COLOR_YELLOW)

def init_dvd(stdscr):
    init_colour()
    stdscr.clear()
    stdscr.refresh()
    curses.noecho()
    stdscr.nodelay(True)
    curses.curs_set(0)
    return stdscr

def dvd(stdscr):
    k = 0

    stdscr = init_dvd(stdscr)
    pos_x = 70
    pos_y = 5
    vector_x = -1
    vector_y = -1
    sq_colour = 1

    while (k != ord('q')):
        stdscr.clear()
        height, width = stdscr.getmaxyx()
        pos_x += vector_x
        pos_y += vector_y

        try:
            stdscr.insstr(pos_y, pos_x, " ", curses.color_pair(sq_colour))
        except:
            #normal sides
            if (pos_x <= 0 or pos_x >= width):
                if (vector_x > 0):
                    vector_x = -1 * randint(1, 2)
                elif (vector_x < 0):
                    vector_x = randint(1, 2)
                pos_x += vector_x

            elif (pos_y <= -1 or pos_y >= height):
                if (vector_y > 0):
                    vector_y = -1 * randint(1, 2)
                elif (vector_y < 0):
                    vector_y = randint(1, 2)
                pos_y += vector_y
            sq_colour = randint(1, 7)
    
        stdscr.refresh()
        time.sleep(0.2)
        k = stdscr.getch()

def main():
    curses.wrapper(dvd)

if __name__ == "__main__":
    main()