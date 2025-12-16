# Microprocessors and Microcontrollers Lab (CE470)

![Project Status: Educational](https://img.shields.io/badge/Project%20Status-Educational-orange)
![Language: Assembly](https://img.shields.io/badge/Language-Assembly-blue)
![Language: C++](https://img.shields.io/badge/Language-C%2B%2B-blue)
![Platform: Linux](https://img.shields.io/badge/Platform-Linux-lightgrey)
![Platform: Arduino](https://img.shields.io/badge/Platform-Arduino-teal)

This repository serves as a comprehensive portfolio of laboratory experiments and learning materials for the **Microprocessors and Microcontrollers (CE470)** course. It documents the practical application of low-level programming concepts, system architecture, and embedded systems design.

## Learning Outcomes
Through this project, I have developed proficiency in:
- **x86 Assembly Language Programming (NASM)**: Understanding registers, memory addressing, and instruction sets.
- **System Level Programming**: Utilizing Linux system calls for I/O operations.
- **Algorithm Implementation**: Translating high-level algorithms (Sorting, Searching) into efficient Assembly code.
- **Embedded Systems**: Interfacing sensors and actuators using Arduino (C++).
- **Modular Programming**: Implementing Macros and Procedures for code reusability.

## Table of Contents

- [Experiment 1: Study Experiment](#experiment-1-study-experiment)
- [Experiment 2: Assembly Level Language Programming (NASM)](#experiment-2-assembly-level-language-programming-nasm)
- [Experiment 3: Mathematical Operations](#experiment-3-mathematical-operations)
- [Experiment 4: Jump and Comparison Operations](#experiment-4-jump-and-comparison-operations)
- [Experiment 5: Study of Macros](#experiment-5-study-of-macros)
- [Experiment 6: Study of Procedures](#experiment-6-study-of-procedures)
- [Experiment 7: Advanced Macros/Procedures](#experiment-7-advanced-macrosprocedures)
- [Experiment 8: Array Operations](#experiment-8-array-operations)
- [Experiment 9: Searching Algorithms](#experiment-9-searching-algorithms)
- [Experiment 10: Sorting Algorithms](#experiment-10-sorting-algorithms)
- [Experiment 11: Arduino Basics](#experiment-11-arduino-basics)
- [Experiment 12: Arduino Applications](#experiment-12-arduino-applications)

## Experiment 1: Study Experiment
- **a.** Case study of history and evolution of microprocessors
- **b.** Case study and comparison of different levels of programming languages
- **c.** Comparison of Intel i3, i5, i7 processors

## Experiment 2: Assembly Level Language Programming (NASM)
- `01_hello_world.asm`: Write an ALP to display "Hello, World!"
- `02_hello_name.asm`: Write an ALP to display Hello World along with your name
- `03_stars.asm`: Write an ALP to display 9 stars using `times` directive
- `04_two_strings.asm`: Write an ALP to display two strings using `EQU` directive
- `05_replace_word.asm`: Write an ALP to replace a word in a given string using `dword`
- `06_read_display_num.asm`: Write an ALP that reads a number from keyboard and displays the number
- `07_print_name_input.asm`: Write an ALP to print your name by taking input from the user
- `08_two_numbers_equ.asm`: Write an ALP to take two numbers as input using `EQU` and display

## Experiment 3: Mathematical Operations
- `01_sum_two_equ.asm`: Write an ALP to enter two numbers and display their sum on screen using `EQU` directive.
- `02_arithmetic_ops.asm`: Write an ALP to perform addition, subtraction, multiplication and division of two entered numbers.
- `03_area_perimeter.asm`: Write an ALP to find area and perimeter of rectangle and triangle.
- `04_sum_three.asm`: Write an ALP to display sum of 3 entered numbers.
- `05_increment_display.asm`: Write an ALP that inputs a number and display the number and the next 4 numbers using increment operation.
- `06_area_circle.asm`: Write an ALP to calculate the area of the circle.
- `07_odd_numbers.asm`: Write an ALP to display all odd numbers from 0 to 9.
- `08_multiples_of_3.asm`: Write an ALP to find the multiples of 3 from 0 to 9.

## Experiment 4: Jump and Comparison Operations
**AIM:** To understand the working of Jump and Comparison operations and to use these operations in writing efficient assembly language programs.
- `01_largest_two.asm`: Write an ALP to find the largest of two numbers.
- `02_largest_three.asm`: Write an ALP to find the largest of three numbers.
- `03_smallest_three.asm`: Write an ALP to find the smallest of three numbers.
- `04_check_5.asm`: Write an ALP to check if the number is greater than 5 or lesser than 5.
- `05_even_odd.asm`: Write an ALP to check whether the entered number is even or odd.
- `06_compare_strings.asm`: Write an ALP that compares two strings and checks if they are same string.
- `07_multiple_3.asm`: Write an ALP to check if a number is a multiple of 3.
- `08_multiple_3_div_test.asm`: Write an ALP to check if a number is a multiple of 3 using divisibility test.

## Experiment 5: Study of Macros
**AIM:** To understand the working of macros and to use macros in writing efficient assembly language programs.
- `01_write_macro.asm`: Write an ALP to implement the write system call to display a number using macros.
- `02_write_two_inputs_macro.asm`: Write an ALP to implement the write system call to display two inputs using macros.
- `03_read_macro.asm`: Write an ALP to implement the read system call using macros to accept a number and display it.
- `04_read_two_inputs_macro.asm`: Write an ALP to implement the read system call using macros to accept two inputs and display it.
- `05_calculator_macro.asm`: Write an ALP to implement calculator program using macros.
- `06_fibonacci_macro.asm`: Write an ALP to print the fibonacci series till n.
- `07_name_9_times_macro.asm`: Write an ALP to print your name 9 times.

## Experiment 6: Study of Procedures
- `01_fibonacci_proc.asm`: Write an ALP to implement Fibonacci series using procedures.
- `02_factorial_proc.asm`: Write an ALP to compute factorial using procedures.
- `03_calculator_proc.asm`: Write an ALP to implement a calculator using procedures.

## Experiment 7: Advanced Macros/Procedures
- `01_sum.asm`: Write an ALP to calculate sum using macros/procedures.
- `02_difference.asm`: Write an ALP to calculate difference using macros/procedures.

## Experiment 8: Array Operations
- `01_array_input_display.asm`: Enter elements in an array and display them.
- `02_count_pos_neg.asm`: Count number of positive and negative elements in an array.
- `03_count_odd_even.asm`: Count number of odd and even numbers in an array.
- `04_count_gt_lt_5.asm`: Count number of elements greater than and less than 5.
- `05_sum_array.asm`: Calculate sum of elements in an array.

## Experiment 9: Searching Algorithms
- `01_binary_search.asm`: Implementation of Binary Search algorithm.
- `02_linear_search.asm`: Implementation of Linear Search algorithm.

## Experiment 10: Sorting Algorithms
- `01_bubble_sort.asm`: Implementation of Bubble Sort algorithm.
- `02_insertion_sort.asm`: Implementation of Insertion Sort algorithm.
- `03_selection_sort.asm`: Implementation of Selection Sort algorithm.

## Experiment 11: Arduino Basics
- `01_blinking_led.ino`: Design an Arduino program to display a blinking LED.

## Experiment 12: Arduino Applications
- `01_traffic_signal.ino`: Design an Arduino program to simulate a traffic signal.

## License
This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.
