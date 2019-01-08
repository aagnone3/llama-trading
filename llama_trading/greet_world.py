import sys


def greet_world(descriptor=None):
    if descriptor:
        sys.stdout.write("Hello, {} World!\n".format(descriptor))
    sys.stdout.write("Hello, World!\n")


if __name__ == '__main__':
    greet_world()
