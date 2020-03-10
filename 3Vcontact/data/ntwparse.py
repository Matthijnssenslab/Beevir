with open('c1.ntw') as f:
    for line in f:
        node1 = line.strip().split(' ')[0]
        node2 = line.strip().split(' ')[1]
        if 'NODE' in node1 and 'NODE' in node2:
            if int(node1.split('_')[4]) > 5000 and int(node2.split('_')[4]) > 5000:
                print(line.strip())
        elif 'NODE' in node1 and 'NODE' not in node2:
            if int(node1.split('_')[4]) > 5000:
                print(line.strip())
        elif 'NODE' not in node2 and 'NODE' in node2:
            if int(node2.split('_')[4]) > 5000:
                 print(line.strip())
        else:
            print(line.strip())
