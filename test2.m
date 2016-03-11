c=containers.Map('KeyType','int32','ValueType','any');
c(1)=[1 1];
c(3)=[2 2];
allKeys=keys(c);
for i=1:c.Count
    c(allKeys(i).(1))
end