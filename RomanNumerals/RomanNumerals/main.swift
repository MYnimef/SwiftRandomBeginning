func toArabic(roman: String) -> Int {
    var arabic = 0, I = 0, V = 0, X = 0, L = 0, C = 0, D = 0, M = 0
    var flag = false, sub = false
    
    for symb in roman {
        switch symb {
        case "I":
            arabic += 1
            I += 1
            X = 0
        case "V":
            if I == 1 {
                arabic += 3
            } else if I > 1 {
                flag = true
            } else {
                arabic += 5
            }

            V += 1
            I = 0
            X = 0
            C = 0
            M = 0
        case "X":
            if I == 1 {
                arabic += 8
                sub = true
            } else if I > 1 || V >= 1 {
                flag = true
            } else {
                arabic += 10
            }

            X += 1
            I = 0
            C = 0
            M = 0
        case "L":
            if X == 1 {
                arabic += 30
            } else if I >= 1 || V >= 1 || X > 1 {
                flag = true
            } else {
                arabic += 50
            }

            L += 1
            I = 0
            X = 0
            C = 0
            M = 0
        case "C":
            if X == 1 {
                arabic += 80;
                if sub {
                    flag = true
                }
                sub = true
            } else if I >= 1 || V >= 1 || X > 1 || L >= 1 {
                flag = true
            } else {
                arabic += 100
            }

            C += 1
            I = 0
            X = 0
            M = 0
        case "D":
            if C == 1 {
                arabic += 300
            } else if I >= 1 || V >= 1 || X >= 1 || L >= 1 || C > 1 {
                flag = true
            } else {
                arabic += 500
            }

            D += 1
            I = 0
            X = 0
            C = 0
            M = 0
        case "M":
            if C == 1 {
                arabic += 800
                if sub {
                    flag = true
                }
            } else if I >= 1 || V >= 1 || X >= 1 || L >= 1 || C > 1 || D >= 1 {
                flag = true
            } else {
                arabic += 1000
            }

            M += 1
            I = 0
            X = 0
            C = 0
        default:
            flag = true
        }
    }

    if I > 3 || V > 1 || X > 3 || L > 1 || C > 3 || D > 1 || M > 3 || flag || arabic >= 4000 {
        return -1
    } else {
        return arabic
    }
}

print("Enter value (not bigger than 3999 in Roman!): ")
if let roman = readLine() {
    print(toArabic(roman: roman))
}
