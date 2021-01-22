f = open("./students.txt", "r")
lines = f.readlines()

data = []

for line in lines:
    name, gitlink, _ = line.split()
    
    last_name, first_name = name.split('_')
    full_name = f'{first_name}_{last_name}'

    last_slash = gitlink.rfind('/')+1
    last_dot = gitlink.rfind('.')

    folder_name= gitlink[last_slash:last_dot]
    
    new_line = f'{full_name} {gitlink} {folder_name}'
    data.append(new_line)

f.close()

with open('./students.txt', 'w') as file:
    for str in data:
        file.write(f'{str}\n')
    

file.close()