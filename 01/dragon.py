from turtle import*

def X(n):
    if n>0: L("X+YF+",n)
def Y(n):
    if n>0: L("-FX-Y",n)

def L(s,n):
    for C in s:
        if C =='-': lt(90)
        elif C == '+': rt(90)
        elif C == 'X': X(n-1)
        elif C == 'Y': Y(n-1)
        elif C == 'F': fd(12)

if __name__ == '__main__':
    X(10)

    mainloop()