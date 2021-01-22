f = open("./students.txt", "r")
lines = f.readlines()

data = []

for line in lines:
    name, gitlink = line.split()
    
    last_name, first_name = name.split('_')
    full_name = f'{first_name}_{last_name}'
    new_line = f'{full_name} {gitlink}'
    data.append(new_line)

f.close()

with open('./students.txt', 'w') as file:
    for str in data:
        file.write(f'{str}\n')
    

file.close()