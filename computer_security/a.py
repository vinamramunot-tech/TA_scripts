f = open("./students.txt", "+r")
lines = f.readlines()

for line in lines:
    name, gitlink = line.split()
    
    last_name, first_name = name.split('_')
    full_name = f'{first_name}_{last_name}'

    f.writelines(full_name)

f.close()