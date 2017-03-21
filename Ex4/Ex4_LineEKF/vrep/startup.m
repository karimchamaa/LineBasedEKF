% Add paths
fileDir = pwd;
paths = genpath([fileDir, '/../']);
paths = [paths, ':', fileDir, '/../../common/vrep'];
paths = [paths, ':', fileDir, '/../../common'];
addpath( paths );
clear fileDir paths
