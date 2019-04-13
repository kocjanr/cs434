import pickle
import collections
import math
import operator

def entropy(data):
    frequency = collections.Counter(item[-1] for item in data)
    def item_entropy(category):
        ratio = float(category)/len(data)
        return -1 * ratio * math.log(ratio,2)
    return sum(item_entropy(c) for  c in frequency.values())

def best_feature_for_split(data):
    baseline = entropy(data)
    def feature_entropy(f):
        def e(v):
            partitioned_data = [d for d in data if d[f] == v]
            proportion = (float(len(partitioned_data))/float(len(data)))
            return proportion * entropy(partitioned_data)
        return sum(e(v) for v in set([d[f] for d in data]))
    features = len(data[0])-1
    information_gain = [ baseline-feature_entropy(f) for f in range(features)]
    best_feature, best_gain = max(enumerate(information_gain),key=operator.itemgetter(1))
    return best_feature

def potential_leaf_node(data):
    count = collections.Counter(i[-1] for i in data)
    return count.most_common(1)[0]

def create_tree(data,label):
    category,count = potential_leaf_node(data)
    if count == len(data):
        return category
    node = {}
    feature = best_feature_for_split(data)
    feature_label = label[feature]
    node[feature_label] = {}
    classes = set(d[feature] for d in data)
    for c in classes:
        partitioned_data = [d for d in data if d[feature]==c]
        node[feature_label][c] = create_tree(partitioned_data,label)
    return node

def classify_data(tree,root,data):
    root = list(tree.keys())[0]
    node = tree[root]
    index = label.index(root)
    for k in node.keys():
        if data[index] == k:
            if isinstance(node[k],dict):
                return classify(node[k],label,data)
            else:
                return node[k]

def as_rule_str(tree,label,ident=0):
    space_indent = '  '*ident
    s = space_indent
    root = list(tree.keys())[0]
    node = tree[root]
    index = label.index(root)
    for k in node.keys():
        s += 'if ' + label[index] + ' = ' + str(k)
        if isinstance(node[k],dict):
            s += ':\n' + space_indent + as_rule_str(node[k],label,ident+1)
        else:
            s += ' then ' + str(node[k]) + ('.\n' if ident==0 else ', ')
    if s[-2] == ', ':
        s = s[:-2]
    s += '\n'
    return s


data = [[0,0,False],[1,0,False],[0,1,True],[1,1,True]]
label = ['x','y','out']

tree = create_tree(data,label)
print(as_rule_str(tree,label))

# with open("data_rand","rb") as f:
#     L = pickle.load(f)