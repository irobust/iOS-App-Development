var a = 10, b = 20

if a == 10 && b == 20{
    print("a is 10")
}

if a == 10 || b == 30{
    print("a is 10 or b is 30")
}

let choice = 1
switch choice {
case 1:
    print("You selected case 1")
case 2:
    print("You selected case 2")
case 3:
    print("You selected case 3")
default:
    print("Other case")
}

let abbr = "kB"

switch abbr{
case "kB", "KB", "kb":
    print("Kilobyte")
default:
    print("Abbriviate not founded")
}

var partialInt = 100...

Int.max
Int.min

a = 5
switch a{
case 1..<5:
    print("a in 1,2,3,4,5")
case 5..<10:
    print("a in 5,6,7,8,9")
default:
    print("a in other range")
}

var n = 1
while n < 10 {
    print(n)
    n += 1
}

n = 1
repeat {
    print(n)
    n += 1
} while n < 10

for i in 1...10{
    print(i)
}

let electricProducts = ["TV", "radio", "item3", "item4"]
for product in electricProducts{
    print(product)
}
print("--------------")

for product in electricProducts[0..<2]{
    print(product)
}
