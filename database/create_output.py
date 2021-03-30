with open('names.txt', 'r') as file:
    name_list = file.readlines()
    for names in name_list:
        name = names.strip().split(", ")
        for counter, value in enumerate(name):
            name[counter] = value.replace("-", "_")
            name[counter] = value.replace(" ", "_")
        
        text = f"""
CS364 HW2, Spring 2021 - /100 

Student name: {name[1]} {name[0]}

Part I ( /68)
Part II ( /32)
"""
        with open(f'HW2_Score_{name[0]}_{name[1]}.txt', 'w') as report_file:
            report_file.write(text)
        