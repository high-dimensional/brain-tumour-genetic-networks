clear
clc

%bayesreg
%J Ruffle j.ruffle@ucl.ac.uk
%Feb 2022

%%
%configure paths
addpath('/home/jruffle/Documents/MATLAB/bayesreg');
addpath('/home/jruffle/Documents/MATLAB/bayesreg/examples');
%%



nsamples = 1e5;
burnin=1e5;

model_results = table;

df = readtable('/home/jruffle/OneDrive/PhD/JupyterOutputs/neuro_onc_data/2022Results/patientnetwork_OCT/patient_sbm_merged.csv');
df=df(contains(df.(101),'Y'),:); %subsample for ones with survival

X = df(:,["age","male","blocks0"]);
X = table2array(X);
%y = df.x36month_survival;
y = df(:,["x36month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x36month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model = 'blocks0'
model_results.prior = 'hs';
model_results.r2 = retval.modelstats.r2;
model_results.waic = retval.modelstats.waic;

%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(2,:) = 'blocks0';
model_results.prior(2,1:1) = 'g';
model_results.r2(2,:) = retval.modelstats.r2;
model_results.waic(2,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(3,:) = 'blocks0';
model_results.prior(3,1:5) = 'ridge';
model_results.r2(3,:) = retval.modelstats.r2;
model_results.waic(3,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(4,:) = 'blocks0';
model_results.prior(4,1:5) = 'lasso';
model_results.r2(4,:) = retval.modelstats.r2;
model_results.waic(4,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(5,:) = 'blocks0';
model_results.prior(5,1:3) = 'hs+';
model_results.r2(5,:) = retval.modelstats.r2;
model_results.waic(5,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(6,:) = 'blocks0';
model_results.prior(6,1:4) = 'logt';
model_results.r2(6,:) = retval.modelstats.r2;
model_results.waic(6,:) = retval.modelstats.waic;
%%
%%block1

X = df(:,["age","male","blocks1"]);
X = table2array(X);
%y = df.x36month_survival;
y = df(:,["x36month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x36month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(7,:) = 'blocks1'
model_results.prior(7,1:2) = 'hs';
model_results.r2(7,:) = retval.modelstats.r2;
model_results.waic(7,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(8,:) = 'blocks1';
model_results.prior(8,1:1) = 'g';
model_results.r2(8,:) = retval.modelstats.r2;
model_results.waic(8,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(9,:) = 'blocks1';
model_results.prior(9,1:5) = 'ridge';
model_results.r2(9,:) = retval.modelstats.r2;
model_results.waic(9,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(10,:) = 'blocks1';
model_results.prior(10,1:5) = 'lasso';
model_results.r2(10,:) = retval.modelstats.r2;
model_results.waic(10,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(11,:) = 'blocks1';
model_results.prior(11,1:3) = 'hs+';
model_results.r2(11,:) = retval.modelstats.r2;
model_results.waic(11,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(12,:) = 'blocks1';
model_results.prior(12,1:4) = 'logt';
model_results.r2(12,:) = retval.modelstats.r2;
model_results.waic(12,:) = retval.modelstats.waic;

%%block 2
X = df(:,["age","male","blocks2"]);
X = table2array(X);
%y = df.x36month_survival;
y = df(:,["x36month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x36month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(13,:) = 'blocks2';
model_results.prior(13,1:2) = 'hs';
model_results.r2(13,:) = retval.modelstats.r2;
model_results.waic(13,:) = retval.modelstats.waic;

%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(14,:) = 'blocks2';
model_results.prior(14,1:1) = 'g';
model_results.r2(14,:) = retval.modelstats.r2;
model_results.waic(14,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(15,:) = 'blocks2';
model_results.prior(15,1:5) = 'ridge';
model_results.r2(15,:) = retval.modelstats.r2;
model_results.waic(15,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(16,:) = 'blocks2';
model_results.prior(16,1:5) = 'lasso';
model_results.r2(16,:) = retval.modelstats.r2;
model_results.waic(16,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(17,:) = 'blocks2';
model_results.prior(17,1:3) = 'hs+';
model_results.r2(17,:) = retval.modelstats.r2;
model_results.waic(17,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(18,:) = 'blocks2';
model_results.prior(18,1:4) = 'logt';
model_results.r2(18,:) = retval.modelstats.r2;
model_results.waic(18,:) = retval.modelstats.waic;
%%
%%block3
X = df(:,["age","male","blocks3"]);
X = table2array(X);
%y = df.x36month_survival;
y = df(:,["x36month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x36month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(19,:) = 'blocks3';
model_results.prior(19,1:2) = 'hs';
model_results.r2(19,:) = retval.modelstats.r2;
model_results.waic(19,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(20,:) = 'blocks3';
model_results.prior(20,1:1) = 'g';
model_results.r2(20,:) = retval.modelstats.r2;
model_results.waic(20,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(21,:) = 'blocks3';
model_results.prior(21,1:5) = 'ridge';
model_results.r2(21,:) = retval.modelstats.r2;
model_results.waic(21,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(22,:) = 'blocks3';
model_results.prior(22,1:5) = 'lasso';
model_results.r2(22,:) = retval.modelstats.r2;
model_results.waic(22,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(23,:) = 'blocks3';
model_results.prior(23,1:3) = 'hs+';
model_results.r2(23,:) = retval.modelstats.r2;
model_results.waic(23,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(24,:) = 'blocks3';
model_results.prior(24,1:4) = 'logt';
model_results.r2(24,:) = retval.modelstats.r2;
model_results.waic(24,:) = retval.modelstats.waic;

%%block 4
X = df(:,["age","male","blocks4"]);
X = table2array(X);
%y = df.x36month_survival;
y = df(:,["x36month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x36month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(25,:) = 'blocks4';
model_results.prior(25,1:2) = 'hs';
model_results.r2(25,:) = retval.modelstats.r2;
model_results.waic(25,:) = retval.modelstats.waic;
%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(26,:) = 'blocks4';
model_results.prior(26,1:1) = 'g';
model_results.r2(26,:) = retval.modelstats.r2;
model_results.waic(26,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(27,:) = 'blocks4';
model_results.prior(27,1:5) = 'ridge';
model_results.r2(27,:) = retval.modelstats.r2;
model_results.waic(27,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(28,:) = 'blocks4';
model_results.prior(28,1:5) = 'lasso';
model_results.r2(28,:) = retval.modelstats.r2;
model_results.waic(28,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(29,:) = 'blocks4';
model_results.prior(29,1:3) = 'hs+';
model_results.r2(29,:) = retval.modelstats.r2;
model_results.waic(29,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(30,:) = 'blocks4';
model_results.prior(30,1:4) = 'logt';
model_results.r2(30,:) = retval.modelstats.r2;
model_results.waic(30,:) = retval.modelstats.waic;

%%block 5
X = df(:,["age","male","blocks5"]);
X = table2array(X);
%y = df.x36month_survival;
y = df(:,["x36month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x36month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(31,:) = 'blocks5';
model_results.prior(31,1:2) = 'hs';
model_results.r2(31,:) = retval.modelstats.r2;
model_results.waic(31,:) = retval.modelstats.waic;
%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(32,:) = 'blocks5';
model_results.prior(32,1:1) = 'g';
model_results.r2(32,:) = retval.modelstats.r2;
model_results.waic(32,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(33,:) = 'blocks5';
model_results.prior(33,1:5) = 'ridge';
model_results.r2(33,:) = retval.modelstats.r2;
model_results.waic(33,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(34,:) = 'blocks5';
model_results.prior(34,1:5) = 'lasso';
model_results.r2(34,:) = retval.modelstats.r2;
model_results.waic(34,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(35,:) = 'blocks5';
model_results.prior(35,1:3) = 'hs+';
model_results.r2(35,:) = retval.modelstats.r2;
model_results.waic(35,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(36,:) = 'blocks5';
model_results.prior(36,1:4) = 'logt';
model_results.r2(36,:) = retval.modelstats.r2;
model_results.waic(36,:) = retval.modelstats.waic;


%%block 6
X = df(:,["age","male","blocks6"]);
X = table2array(X);
%y = df.x36month_survival;
y = df(:,["x36month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x36month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(37,:) = 'blocks6';
model_results.prior(37,1:2) = 'hs';
model_results.r2(37,:) = retval.modelstats.r2;
model_results.waic(37,:) = retval.modelstats.waic;
%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(38,:) = 'blocks6';
model_results.prior(38,1:1) = 'g';
model_results.r2(38,:) = retval.modelstats.r2;
model_results.waic(38,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(39,:) = 'blocks6';
model_results.prior(39,1:5) = 'ridge';
model_results.r2(39,:) = retval.modelstats.r2;
model_results.waic(39,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(40,:) = 'blocks6';
model_results.prior(40,1:5) = 'lasso';
model_results.r2(40,:) = retval.modelstats.r2;
model_results.waic(40,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(41,:) = 'blocks6';
model_results.prior(41,1:3) = 'hs+';
model_results.r2(41,:) = retval.modelstats.r2;
model_results.waic(41,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(42,:) = 'blocks6';
model_results.prior(42,1:4) = 'logt';
model_results.r2(42,:) = retval.modelstats.r2;
model_results.waic(42,:) = retval.modelstats.waic;


%% with diagnosis

X = df(:,["age","male","diagnosis_numerical"]);
X = table2array(X);
%y = df.x36month_survival;
y = df(:,["x36month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x36month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','diagnosis'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(43,1:9) = 'diagnosis';
model_results.prior(43,1:2) = 'hs';
model_results.r2(43,:) = retval.modelstats.r2;
model_results.waic(43,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(44,:) = 'diagnosis';
model_results.prior(44,1:1) = 'g';
model_results.r2(44,:) = retval.modelstats.r2;
model_results.waic(44,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(45,:) = 'diagnosis';
model_results.prior(45,1:5) = 'ridge';
model_results.r2(45,:) = retval.modelstats.r2;
model_results.waic(45,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(46,:) = 'diagnosis';
model_results.prior(46,1:5) = 'lasso';
model_results.r2(46,:) = retval.modelstats.r2;
model_results.waic(46,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(47,:) = 'diagnosis';
model_results.prior(47,1:3) = 'hs+';
model_results.r2(47,:) = retval.modelstats.r2;
model_results.waic(47,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(48,:) = 'diagnosis';
model_results.prior(48,1:4) = 'logt';
model_results.r2(48,:) = retval.modelstats.r2;
model_results.waic(48,:) = retval.modelstats.waic;


%%
% %% with all levels
% 
% X = df(:,["age","male","blocks0","blocks1","blocks2","blocks3","blocks4","blocks5","blocks6"]);
% X = table2array(X);
% %y = df.x36month_survival;
% y = df(:,["x36month_survival"]);
% outcome = {'Y', 'N'};
% outcome_binary = [      1,        0];
% [wasfound, idx] = ismember(y.x36month_survival, outcome);
% f_values = nan(length(idx), 1);
% f_values(wasfound) = outcome_binary(idx(wasfound));
% y = f_values;
% 
% varnames = {'age','male','block0','block1','block2','block3','block4','block5','block6'};
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(49,1:10) = 'all_blocks';
% model_results.prior(49,1:2) = 'hs';
% model_results.r2(49,:) = retval.modelstats.r2;
% model_results.waic(49,:) = retval.modelstats.waic;
% 
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(50,1:10) = 'all_blocks';
% model_results.prior(50,1:1) = 'g';
% model_results.r2(50,:) = retval.modelstats.r2;
% model_results.waic(50,:) = retval.modelstats.waic;
% 
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(51,:) = 'all_blocks';
% model_results.prior(51,1:5) = 'ridge';
% model_results.r2(51,:) = retval.modelstats.r2;
% model_results.waic(51,:) = retval.modelstats.waic;
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(52,:) = 'all_blocks';
% model_results.prior(52,1:5) = 'lasso';
% model_results.r2(52,:) = retval.modelstats.r2;
% model_results.waic(52,:) = retval.modelstats.waic;
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(53,:) = 'all_blocks';
% model_results.prior(53,1:3) = 'hs+';
% model_results.r2(53,:) = retval.modelstats.r2;
% model_results.waic(53,:) = retval.modelstats.waic;
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(54,:) = 'all_blocks';
% model_results.prior(54,1:4) = 'logt';
% model_results.r2(54,:) = retval.modelstats.r2;
% model_results.waic(54,:) = retval.modelstats.waic;


%%
%genetics


X = df(:,["age","male","atrx_loss","braf_wt","egfr_amp","hist_wt","idh_mut","mgmt_meth","onep19q_deletion","tert_mut"]);
X = table2array(X);
%y = df.x36month_survival;
y = df(:,["x36month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x36month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','atrx_loss','braf_wt','egfr_amp','hist_wt','idh_mut','mgmt_meth','onep19q_deletion','tert_mut'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(49,1:15) = 'linear_genetics';
model_results.prior(49,1:2) = 'hs';
model_results.r2(49,:) = retval.modelstats.r2;
model_results.waic(49,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(50,1:15) = 'linear_genetics';
model_results.prior(50,1:1) = 'g';
model_results.r2(50,:) = retval.modelstats.r2;
model_results.waic(50,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(51,1:15) = 'linear_genetics';
model_results.prior(51,1:5) = 'ridge';
model_results.r2(51,:) = retval.modelstats.r2;
model_results.waic(51,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(52,1:15) = 'linear_genetics';
model_results.prior(52,1:5) = 'lasso';
model_results.r2(52,:) = retval.modelstats.r2;
model_results.waic(52,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(53,1:15) = 'linear_genetics';
model_results.prior(53,1:3) = 'hs+';
model_results.r2(53,:) = retval.modelstats.r2;
model_results.waic(53,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(54,1:15) = 'linear_genetics';
model_results.prior(54,1:4) = 'logt';
model_results.r2(54,:) = retval.modelstats.r2;
model_results.waic(54,:) = retval.modelstats.waic


%%
nonlinear_df = readtable('/home/jruffle/OneDrive/PhD/JupyterOutputs/neuro_onc_data/2022Results/patientnetwork_OCT/nonlinear_genetics.csv');

y = nonlinear_df(:,["x36month_survival"]);

nonlinear_df.x36month_survival=[];
nonlinear_df.x24month_survival=[];
nonlinear_df.x12month_survival=[];
nonlinear_df.Var1=[];

X = table2array(nonlinear_df);
%y = df.x36month_survival;
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x36month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

%varnames = {'age','male','atrx_loss','braf_wt','egfr_amp','hist_wt','idh_mut','mgmt_meth','onep19q_deletion','tert_mut'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(55,1:18) = 'nonlinear_genetics';
model_results.prior(55,1:2) = 'hs';
model_results.r2(55,:) = retval.modelstats.r2;
model_results.waic(55,:) = retval.modelstats.waic;


%[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(56,1:18) = 'nonlinear_genetics';
model_results.prior(56,1:1) = 'g';
model_results.r2(56,:) = 0;
model_results.waic(56,:) = 10000;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(57,1:18) = 'nonlinear_genetics';
model_results.prior(57,1:5) = 'ridge';
model_results.r2(57,:) = retval.modelstats.r2;
model_results.waic(57,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(58,1:18) = 'nonlinear_genetics';
model_results.prior(58,1:5) = 'lasso';
model_results.r2(58,:) = retval.modelstats.r2;
model_results.waic(58,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(59,1:18) = 'nonlinear_genetics';
model_results.prior(59,1:3) = 'hs+';
model_results.r2(59,:) = retval.modelstats.r2;
model_results.waic(59,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(60,1:18) = 'nonlinear_genetics';
model_results.prior(60,1:4) = 'logt';
model_results.r2(60,:) = retval.modelstats.r2;
model_results.waic(60,:) = retval.modelstats.waic;


%%
%%save results
writetable(model_results,'/home/jruffle/OneDrive/PhD/JupyterOutputs/neuro_onc_data/2022Results/patientnetwork_OCT/bayesreg_survival_results_36months.csv');




%%
%%
%%my data...

nsamples = 1e1;
burnin=1e1;
% 
% nsamples = 1e5;
% burnin=1e5;

model_results = table;

df = readtable('/home/jruffle/OneDrive/PhD/JupyterOutputs/neuro_onc_data/2022Results/patientnetwork_OCT/patient_sbm_merged.csv');
df=df(contains(df.(101),'Y'),:); %subsample for ones with survival

X = df(:,["age","male","blocks0"]);
X = table2array(X);
%y = df.x24month_survival;
y = df(:,["x24month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x24month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model = 'blocks0'
model_results.prior = 'hs';
model_results.r2 = retval.modelstats.r2;
model_results.waic = retval.modelstats.waic;

%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(2,:) = 'blocks0';
model_results.prior(2,1:1) = 'g';
model_results.r2(2,:) = retval.modelstats.r2;
model_results.waic(2,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(3,:) = 'blocks0';
model_results.prior(3,1:5) = 'ridge';
model_results.r2(3,:) = retval.modelstats.r2;
model_results.waic(3,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(4,:) = 'blocks0';
model_results.prior(4,1:5) = 'lasso';
model_results.r2(4,:) = retval.modelstats.r2;
model_results.waic(4,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(5,:) = 'blocks0';
model_results.prior(5,1:3) = 'hs+';
model_results.r2(5,:) = retval.modelstats.r2;
model_results.waic(5,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(6,:) = 'blocks0';
model_results.prior(6,1:4) = 'logt';
model_results.r2(6,:) = retval.modelstats.r2;
model_results.waic(6,:) = retval.modelstats.waic;
%%
%%block1

X = df(:,["age","male","blocks1"]);
X = table2array(X);
%y = df.x24month_survival;
y = df(:,["x24month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x24month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(7,:) = 'blocks1'
model_results.prior(7,1:2) = 'hs';
model_results.r2(7,:) = retval.modelstats.r2;
model_results.waic(7,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(8,:) = 'blocks1';
model_results.prior(8,1:1) = 'g';
model_results.r2(8,:) = retval.modelstats.r2;
model_results.waic(8,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(9,:) = 'blocks1';
model_results.prior(9,1:5) = 'ridge';
model_results.r2(9,:) = retval.modelstats.r2;
model_results.waic(9,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(10,:) = 'blocks1';
model_results.prior(10,1:5) = 'lasso';
model_results.r2(10,:) = retval.modelstats.r2;
model_results.waic(10,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(11,:) = 'blocks1';
model_results.prior(11,1:3) = 'hs+';
model_results.r2(11,:) = retval.modelstats.r2;
model_results.waic(11,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(12,:) = 'blocks1';
model_results.prior(12,1:4) = 'logt';
model_results.r2(12,:) = retval.modelstats.r2;
model_results.waic(12,:) = retval.modelstats.waic;

%%block 2
X = df(:,["age","male","blocks2"]);
X = table2array(X);
%y = df.x24month_survival;
y = df(:,["x24month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x24month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(13,:) = 'blocks2';
model_results.prior(13,1:2) = 'hs';
model_results.r2(13,:) = retval.modelstats.r2;
model_results.waic(13,:) = retval.modelstats.waic;

%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(14,:) = 'blocks2';
model_results.prior(14,1:1) = 'g';
model_results.r2(14,:) = retval.modelstats.r2;
model_results.waic(14,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(15,:) = 'blocks2';
model_results.prior(15,1:5) = 'ridge';
model_results.r2(15,:) = retval.modelstats.r2;
model_results.waic(15,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(16,:) = 'blocks2';
model_results.prior(16,1:5) = 'lasso';
model_results.r2(16,:) = retval.modelstats.r2;
model_results.waic(16,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(17,:) = 'blocks2';
model_results.prior(17,1:3) = 'hs+';
model_results.r2(17,:) = retval.modelstats.r2;
model_results.waic(17,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(18,:) = 'blocks2';
model_results.prior(18,1:4) = 'logt';
model_results.r2(18,:) = retval.modelstats.r2;
model_results.waic(18,:) = retval.modelstats.waic;
%%
%%block3
X = df(:,["age","male","blocks3"]);
X = table2array(X);
%y = df.x24month_survival;
y = df(:,["x24month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x24month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(19,:) = 'blocks3';
model_results.prior(19,1:2) = 'hs';
model_results.r2(19,:) = retval.modelstats.r2;
model_results.waic(19,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(20,:) = 'blocks3';
model_results.prior(20,1:1) = 'g';
model_results.r2(20,:) = retval.modelstats.r2;
model_results.waic(20,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(21,:) = 'blocks3';
model_results.prior(21,1:5) = 'ridge';
model_results.r2(21,:) = retval.modelstats.r2;
model_results.waic(21,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(22,:) = 'blocks3';
model_results.prior(22,1:5) = 'lasso';
model_results.r2(22,:) = retval.modelstats.r2;
model_results.waic(22,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(23,:) = 'blocks3';
model_results.prior(23,1:3) = 'hs+';
model_results.r2(23,:) = retval.modelstats.r2;
model_results.waic(23,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(24,:) = 'blocks3';
model_results.prior(24,1:4) = 'logt';
model_results.r2(24,:) = retval.modelstats.r2;
model_results.waic(24,:) = retval.modelstats.waic;

%%block 4
X = df(:,["age","male","blocks4"]);
X = table2array(X);
%y = df.x24month_survival;
y = df(:,["x24month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x24month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(25,:) = 'blocks4';
model_results.prior(25,1:2) = 'hs';
model_results.r2(25,:) = retval.modelstats.r2;
model_results.waic(25,:) = retval.modelstats.waic;
%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(26,:) = 'blocks4';
model_results.prior(26,1:1) = 'g';
model_results.r2(26,:) = retval.modelstats.r2;
model_results.waic(26,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(27,:) = 'blocks4';
model_results.prior(27,1:5) = 'ridge';
model_results.r2(27,:) = retval.modelstats.r2;
model_results.waic(27,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(28,:) = 'blocks4';
model_results.prior(28,1:5) = 'lasso';
model_results.r2(28,:) = retval.modelstats.r2;
model_results.waic(28,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(29,:) = 'blocks4';
model_results.prior(29,1:3) = 'hs+';
model_results.r2(29,:) = retval.modelstats.r2;
model_results.waic(29,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(30,:) = 'blocks4';
model_results.prior(30,1:4) = 'logt';
model_results.r2(30,:) = retval.modelstats.r2;
model_results.waic(30,:) = retval.modelstats.waic;

%%block 5
X = df(:,["age","male","blocks5"]);
X = table2array(X);
%y = df.x24month_survival;
y = df(:,["x24month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x24month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(31,:) = 'blocks5';
model_results.prior(31,1:2) = 'hs';
model_results.r2(31,:) = retval.modelstats.r2;
model_results.waic(31,:) = retval.modelstats.waic;
%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(32,:) = 'blocks5';
model_results.prior(32,1:1) = 'g';
model_results.r2(32,:) = retval.modelstats.r2;
model_results.waic(32,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(33,:) = 'blocks5';
model_results.prior(33,1:5) = 'ridge';
model_results.r2(33,:) = retval.modelstats.r2;
model_results.waic(33,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(34,:) = 'blocks5';
model_results.prior(34,1:5) = 'lasso';
model_results.r2(34,:) = retval.modelstats.r2;
model_results.waic(34,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(35,:) = 'blocks5';
model_results.prior(35,1:3) = 'hs+';
model_results.r2(35,:) = retval.modelstats.r2;
model_results.waic(35,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(36,:) = 'blocks5';
model_results.prior(36,1:4) = 'logt';
model_results.r2(36,:) = retval.modelstats.r2;
model_results.waic(36,:) = retval.modelstats.waic;


%%block 6
X = df(:,["age","male","blocks6"]);
X = table2array(X);
%y = df.x24month_survival;
y = df(:,["x24month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x24month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(37,:) = 'blocks6';
model_results.prior(37,1:2) = 'hs';
model_results.r2(37,:) = retval.modelstats.r2;
model_results.waic(37,:) = retval.modelstats.waic;
%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(38,:) = 'blocks6';
model_results.prior(38,1:1) = 'g';
model_results.r2(38,:) = retval.modelstats.r2;
model_results.waic(38,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(39,:) = 'blocks6';
model_results.prior(39,1:5) = 'ridge';
model_results.r2(39,:) = retval.modelstats.r2;
model_results.waic(39,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(40,:) = 'blocks6';
model_results.prior(40,1:5) = 'lasso';
model_results.r2(40,:) = retval.modelstats.r2;
model_results.waic(40,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(41,:) = 'blocks6';
model_results.prior(41,1:3) = 'hs+';
model_results.r2(41,:) = retval.modelstats.r2;
model_results.waic(41,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(42,:) = 'blocks6';
model_results.prior(42,1:4) = 'logt';
model_results.r2(42,:) = retval.modelstats.r2;
model_results.waic(42,:) = retval.modelstats.waic;


%% with diagnosis

X = df(:,["age","male","diagnosis_numerical"]);
X = table2array(X);
%y = df.x24month_survival;
y = df(:,["x24month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x24month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','diagnosis'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(43,1:9) = 'diagnosis';
model_results.prior(43,1:2) = 'hs';
model_results.r2(43,:) = retval.modelstats.r2;
model_results.waic(43,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(44,:) = 'diagnosis';
model_results.prior(44,1:1) = 'g';
model_results.r2(44,:) = retval.modelstats.r2;
model_results.waic(44,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(45,:) = 'diagnosis';
model_results.prior(45,1:5) = 'ridge';
model_results.r2(45,:) = retval.modelstats.r2;
model_results.waic(45,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(46,:) = 'diagnosis';
model_results.prior(46,1:5) = 'lasso';
model_results.r2(46,:) = retval.modelstats.r2;
model_results.waic(46,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(47,:) = 'diagnosis';
model_results.prior(47,1:3) = 'hs+';
model_results.r2(47,:) = retval.modelstats.r2;
model_results.waic(47,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(48,:) = 'diagnosis';
model_results.prior(48,1:4) = 'logt';
model_results.r2(48,:) = retval.modelstats.r2;
model_results.waic(48,:) = retval.modelstats.waic;


%%
% %% with all levels
% 
% X = df(:,["age","male","blocks0","blocks1","blocks2","blocks3","blocks4","blocks5","blocks6"]);
% X = table2array(X);
% %y = df.x24month_survival;
% y = df(:,["x24month_survival"]);
% outcome = {'Y', 'N'};
% outcome_binary = [      1,        0];
% [wasfound, idx] = ismember(y.x24month_survival, outcome);
% f_values = nan(length(idx), 1);
% f_values(wasfound) = outcome_binary(idx(wasfound));
% y = f_values;
% 
% varnames = {'age','male','block0','block1','block2','block3','block4','block5','block6'};
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(49,1:10) = 'all_blocks';
% model_results.prior(49,1:2) = 'hs';
% model_results.r2(49,:) = retval.modelstats.r2;
% model_results.waic(49,:) = retval.modelstats.waic;
% 
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(50,1:10) = 'all_blocks';
% model_results.prior(50,1:1) = 'g';
% model_results.r2(50,:) = retval.modelstats.r2;
% model_results.waic(50,:) = retval.modelstats.waic;
% 
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(51,:) = 'all_blocks';
% model_results.prior(51,1:5) = 'ridge';
% model_results.r2(51,:) = retval.modelstats.r2;
% model_results.waic(51,:) = retval.modelstats.waic;
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(52,:) = 'all_blocks';
% model_results.prior(52,1:5) = 'lasso';
% model_results.r2(52,:) = retval.modelstats.r2;
% model_results.waic(52,:) = retval.modelstats.waic;
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(53,:) = 'all_blocks';
% model_results.prior(53,1:3) = 'hs+';
% model_results.r2(53,:) = retval.modelstats.r2;
% model_results.waic(53,:) = retval.modelstats.waic;
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(54,:) = 'all_blocks';
% model_results.prior(54,1:4) = 'logt';
% model_results.r2(54,:) = retval.modelstats.r2;
% model_results.waic(54,:) = retval.modelstats.waic;


%%
%genetics


X = df(:,["age","male","atrx_loss","braf_wt","egfr_amp","hist_wt","idh_mut","mgmt_meth","onep19q_deletion","tert_mut"]);
X = table2array(X);
%y = df.x24month_survival;
y = df(:,["x24month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x24month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','atrx_loss','braf_wt','egfr_amp','hist_wt','idh_mut','mgmt_meth','onep19q_deletion','tert_mut'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(49,1:15) = 'linear_genetics';
model_results.prior(49,1:2) = 'hs';
model_results.r2(49,:) = retval.modelstats.r2;
model_results.waic(49,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(50,1:15) = 'linear_genetics';
model_results.prior(50,1:1) = 'g';
model_results.r2(50,:) = retval.modelstats.r2;
model_results.waic(50,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(51,1:15) = 'linear_genetics';
model_results.prior(51,1:5) = 'ridge';
model_results.r2(51,:) = retval.modelstats.r2;
model_results.waic(51,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(52,1:15) = 'linear_genetics';
model_results.prior(52,1:5) = 'lasso';
model_results.r2(52,:) = retval.modelstats.r2;
model_results.waic(52,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(53,1:15) = 'linear_genetics';
model_results.prior(53,1:3) = 'hs+';
model_results.r2(53,:) = retval.modelstats.r2;
model_results.waic(53,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(54,1:15) = 'linear_genetics';
model_results.prior(54,1:4) = 'logt';
model_results.r2(54,:) = retval.modelstats.r2;
model_results.waic(54,:) = retval.modelstats.waic


%%
nonlinear_df = readtable('/home/jruffle/OneDrive/PhD/JupyterOutputs/neuro_onc_data/2022Results/patientnetwork_OCT/nonlinear_genetics.csv');

y = nonlinear_df(:,["x24month_survival"]);

nonlinear_df.x36month_survival=[];
nonlinear_df.x24month_survival=[];
nonlinear_df.x12month_survival=[];
nonlinear_df.Var1=[];

X = table2array(nonlinear_df);
%y = df.x24month_survival;
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x24month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

%varnames = {'age','male','atrx_loss','braf_wt','egfr_amp','hist_wt','idh_mut','mgmt_meth','onep19q_deletion','tert_mut'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(55,1:18) = 'nonlinear_genetics';
model_results.prior(55,1:2) = 'hs';
model_results.r2(55,:) = retval.modelstats.r2;
model_results.waic(55,:) = retval.modelstats.waic;


%[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(56,1:18) = 'nonlinear_genetics';
model_results.prior(56,1:1) = 'g';
model_results.r2(56,:) = 0;
model_results.waic(56,:) = 10000;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(57,1:18) = 'nonlinear_genetics';
model_results.prior(57,1:5) = 'ridge';
model_results.r2(57,:) = retval.modelstats.r2;
model_results.waic(57,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(58,1:18) = 'nonlinear_genetics';
model_results.prior(58,1:5) = 'lasso';
model_results.r2(58,:) = retval.modelstats.r2;
model_results.waic(58,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(59,1:18) = 'nonlinear_genetics';
model_results.prior(59,1:3) = 'hs+';
model_results.r2(59,:) = retval.modelstats.r2;
model_results.waic(59,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(60,1:18) = 'nonlinear_genetics';
model_results.prior(60,1:4) = 'logt';
model_results.r2(60,:) = retval.modelstats.r2;
model_results.waic(60,:) = retval.modelstats.waic;


%%
%%save results
writetable(model_results,'/home/jruffle/OneDrive/PhD/JupyterOutputs/neuro_onc_data/2022Results/patientnetwork_OCT/bayesreg_survival_results_24months.csv');


%%
%%my data...

%nsamples = 1e1;
%burnin=1e1;
% 
nsamples = 1e5;
burnin=1e5;

model_results = table;

df = readtable('/home/jruffle/OneDrive/PhD/JupyterOutputs/neuro_onc_data/2022Results/patientnetwork_OCT/patient_sbm_merged.csv');
df=df(contains(df.(101),'Y'),:); %subsample for ones with survival

X = df(:,["age","male","blocks0"]);
X = table2array(X);
%y = df.x12month_survival;
y = df(:,["x12month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x12month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model = 'blocks0'
model_results.prior = 'hs';
model_results.r2 = retval.modelstats.r2;
model_results.waic = retval.modelstats.waic;

%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(2,:) = 'blocks0';
model_results.prior(2,1:1) = 'g';
model_results.r2(2,:) = retval.modelstats.r2;
model_results.waic(2,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(3,:) = 'blocks0';
model_results.prior(3,1:5) = 'ridge';
model_results.r2(3,:) = retval.modelstats.r2;
model_results.waic(3,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(4,:) = 'blocks0';
model_results.prior(4,1:5) = 'lasso';
model_results.r2(4,:) = retval.modelstats.r2;
model_results.waic(4,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(5,:) = 'blocks0';
model_results.prior(5,1:3) = 'hs+';
model_results.r2(5,:) = retval.modelstats.r2;
model_results.waic(5,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(6,:) = 'blocks0';
model_results.prior(6,1:4) = 'logt';
model_results.r2(6,:) = retval.modelstats.r2;
model_results.waic(6,:) = retval.modelstats.waic;
%%
%%block1

X = df(:,["age","male","blocks1"]);
X = table2array(X);
%y = df.x12month_survival;
y = df(:,["x12month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x12month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(7,:) = 'blocks1'
model_results.prior(7,1:2) = 'hs';
model_results.r2(7,:) = retval.modelstats.r2;
model_results.waic(7,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(8,:) = 'blocks1';
model_results.prior(8,1:1) = 'g';
model_results.r2(8,:) = retval.modelstats.r2;
model_results.waic(8,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(9,:) = 'blocks1';
model_results.prior(9,1:5) = 'ridge';
model_results.r2(9,:) = retval.modelstats.r2;
model_results.waic(9,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(10,:) = 'blocks1';
model_results.prior(10,1:5) = 'lasso';
model_results.r2(10,:) = retval.modelstats.r2;
model_results.waic(10,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(11,:) = 'blocks1';
model_results.prior(11,1:3) = 'hs+';
model_results.r2(11,:) = retval.modelstats.r2;
model_results.waic(11,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(12,:) = 'blocks1';
model_results.prior(12,1:4) = 'logt';
model_results.r2(12,:) = retval.modelstats.r2;
model_results.waic(12,:) = retval.modelstats.waic;

%%block 2
X = df(:,["age","male","blocks2"]);
X = table2array(X);
%y = df.x12month_survival;
y = df(:,["x12month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x12month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(13,:) = 'blocks2';
model_results.prior(13,1:2) = 'hs';
model_results.r2(13,:) = retval.modelstats.r2;
model_results.waic(13,:) = retval.modelstats.waic;

%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(14,:) = 'blocks2';
model_results.prior(14,1:1) = 'g';
model_results.r2(14,:) = retval.modelstats.r2;
model_results.waic(14,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(15,:) = 'blocks2';
model_results.prior(15,1:5) = 'ridge';
model_results.r2(15,:) = retval.modelstats.r2;
model_results.waic(15,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(16,:) = 'blocks2';
model_results.prior(16,1:5) = 'lasso';
model_results.r2(16,:) = retval.modelstats.r2;
model_results.waic(16,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(17,:) = 'blocks2';
model_results.prior(17,1:3) = 'hs+';
model_results.r2(17,:) = retval.modelstats.r2;
model_results.waic(17,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(18,:) = 'blocks2';
model_results.prior(18,1:4) = 'logt';
model_results.r2(18,:) = retval.modelstats.r2;
model_results.waic(18,:) = retval.modelstats.waic;
%%
%%block3
X = df(:,["age","male","blocks3"]);
X = table2array(X);
%y = df.x12month_survival;
y = df(:,["x12month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x12month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(19,:) = 'blocks3';
model_results.prior(19,1:2) = 'hs';
model_results.r2(19,:) = retval.modelstats.r2;
model_results.waic(19,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(20,:) = 'blocks3';
model_results.prior(20,1:1) = 'g';
model_results.r2(20,:) = retval.modelstats.r2;
model_results.waic(20,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(21,:) = 'blocks3';
model_results.prior(21,1:5) = 'ridge';
model_results.r2(21,:) = retval.modelstats.r2;
model_results.waic(21,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(22,:) = 'blocks3';
model_results.prior(22,1:5) = 'lasso';
model_results.r2(22,:) = retval.modelstats.r2;
model_results.waic(22,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(23,:) = 'blocks3';
model_results.prior(23,1:3) = 'hs+';
model_results.r2(23,:) = retval.modelstats.r2;
model_results.waic(23,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(24,:) = 'blocks3';
model_results.prior(24,1:4) = 'logt';
model_results.r2(24,:) = retval.modelstats.r2;
model_results.waic(24,:) = retval.modelstats.waic;

%%block 4
X = df(:,["age","male","blocks4"]);
X = table2array(X);
%y = df.x12month_survival;
y = df(:,["x12month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x12month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(25,:) = 'blocks4';
model_results.prior(25,1:2) = 'hs';
model_results.r2(25,:) = retval.modelstats.r2;
model_results.waic(25,:) = retval.modelstats.waic;
%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(26,:) = 'blocks4';
model_results.prior(26,1:1) = 'g';
model_results.r2(26,:) = retval.modelstats.r2;
model_results.waic(26,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(27,:) = 'blocks4';
model_results.prior(27,1:5) = 'ridge';
model_results.r2(27,:) = retval.modelstats.r2;
model_results.waic(27,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(28,:) = 'blocks4';
model_results.prior(28,1:5) = 'lasso';
model_results.r2(28,:) = retval.modelstats.r2;
model_results.waic(28,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(29,:) = 'blocks4';
model_results.prior(29,1:3) = 'hs+';
model_results.r2(29,:) = retval.modelstats.r2;
model_results.waic(29,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(30,:) = 'blocks4';
model_results.prior(30,1:4) = 'logt';
model_results.r2(30,:) = retval.modelstats.r2;
model_results.waic(30,:) = retval.modelstats.waic;

%%block 5
X = df(:,["age","male","blocks5"]);
X = table2array(X);
%y = df.x12month_survival;
y = df(:,["x12month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x12month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(31,:) = 'blocks5';
model_results.prior(31,1:2) = 'hs';
model_results.r2(31,:) = retval.modelstats.r2;
model_results.waic(31,:) = retval.modelstats.waic;
%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(32,:) = 'blocks5';
model_results.prior(32,1:1) = 'g';
model_results.r2(32,:) = retval.modelstats.r2;
model_results.waic(32,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(33,:) = 'blocks5';
model_results.prior(33,1:5) = 'ridge';
model_results.r2(33,:) = retval.modelstats.r2;
model_results.waic(33,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(34,:) = 'blocks5';
model_results.prior(34,1:5) = 'lasso';
model_results.r2(34,:) = retval.modelstats.r2;
model_results.waic(34,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(35,:) = 'blocks5';
model_results.prior(35,1:3) = 'hs+';
model_results.r2(35,:) = retval.modelstats.r2;
model_results.waic(35,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(36,:) = 'blocks5';
model_results.prior(36,1:4) = 'logt';
model_results.r2(36,:) = retval.modelstats.r2;
model_results.waic(36,:) = retval.modelstats.waic;


%%block 6
X = df(:,["age","male","blocks6"]);
X = table2array(X);
%y = df.x12month_survival;
y = df(:,["x12month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x12month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','blocks'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(37,:) = 'blocks6';
model_results.prior(37,1:2) = 'hs';
model_results.r2(37,:) = retval.modelstats.r2;
model_results.waic(37,:) = retval.modelstats.waic;
%%
[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(38,:) = 'blocks6';
model_results.prior(38,1:1) = 'g';
model_results.r2(38,:) = retval.modelstats.r2;
model_results.waic(38,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(39,:) = 'blocks6';
model_results.prior(39,1:5) = 'ridge';
model_results.r2(39,:) = retval.modelstats.r2;
model_results.waic(39,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(40,:) = 'blocks6';
model_results.prior(40,1:5) = 'lasso';
model_results.r2(40,:) = retval.modelstats.r2;
model_results.waic(40,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(41,:) = 'blocks6';
model_results.prior(41,1:3) = 'hs+';
model_results.r2(41,:) = retval.modelstats.r2;
model_results.waic(41,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(42,:) = 'blocks6';
model_results.prior(42,1:4) = 'logt';
model_results.r2(42,:) = retval.modelstats.r2;
model_results.waic(42,:) = retval.modelstats.waic;


%% with diagnosis

X = df(:,["age","male","diagnosis_numerical"]);
X = table2array(X);
%y = df.x12month_survival;
y = df(:,["x12month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x12month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','diagnosis'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(43,1:9) = 'diagnosis';
model_results.prior(43,1:2) = 'hs';
model_results.r2(43,:) = retval.modelstats.r2;
model_results.waic(43,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(44,:) = 'diagnosis';
model_results.prior(44,1:1) = 'g';
model_results.r2(44,:) = retval.modelstats.r2;
model_results.waic(44,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(45,:) = 'diagnosis';
model_results.prior(45,1:5) = 'ridge';
model_results.r2(45,:) = retval.modelstats.r2;
model_results.waic(45,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(46,:) = 'diagnosis';
model_results.prior(46,1:5) = 'lasso';
model_results.r2(46,:) = retval.modelstats.r2;
model_results.waic(46,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(47,:) = 'diagnosis';
model_results.prior(47,1:3) = 'hs+';
model_results.r2(47,:) = retval.modelstats.r2;
model_results.waic(47,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
model_results.model(48,:) = 'diagnosis';
model_results.prior(48,1:4) = 'logt';
model_results.r2(48,:) = retval.modelstats.r2;
model_results.waic(48,:) = retval.modelstats.waic;


%%
% %% with all levels
% 
% X = df(:,["age","male","blocks0","blocks1","blocks2","blocks3","blocks4","blocks5","blocks6"]);
% X = table2array(X);
% %y = df.x12month_survival;
% y = df(:,["x12month_survival"]);
% outcome = {'Y', 'N'};
% outcome_binary = [      1,        0];
% [wasfound, idx] = ismember(y.x12month_survival, outcome);
% f_values = nan(length(idx), 1);
% f_values(wasfound) = outcome_binary(idx(wasfound));
% y = f_values;
% 
% varnames = {'age','male','block0','block1','block2','block3','block4','block5','block6'};
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(49,1:10) = 'all_blocks';
% model_results.prior(49,1:2) = 'hs';
% model_results.r2(49,:) = retval.modelstats.r2;
% model_results.waic(49,:) = retval.modelstats.waic;
% 
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(50,1:10) = 'all_blocks';
% model_results.prior(50,1:1) = 'g';
% model_results.r2(50,:) = retval.modelstats.r2;
% model_results.waic(50,:) = retval.modelstats.waic;
% 
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(51,:) = 'all_blocks';
% model_results.prior(51,1:5) = 'ridge';
% model_results.r2(51,:) = retval.modelstats.r2;
% model_results.waic(51,:) = retval.modelstats.waic;
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(52,:) = 'all_blocks';
% model_results.prior(52,1:5) = 'lasso';
% model_results.r2(52,:) = retval.modelstats.r2;
% model_results.waic(52,:) = retval.modelstats.waic;
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(53,:) = 'all_blocks';
% model_results.prior(53,1:3) = 'hs+';
% model_results.r2(53,:) = retval.modelstats.r2;
% model_results.waic(53,:) = retval.modelstats.waic;
% 
% [beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3],'sortrank',true);
% model_results.model(54,:) = 'all_blocks';
% model_results.prior(54,1:4) = 'logt';
% model_results.r2(54,:) = retval.modelstats.r2;
% model_results.waic(54,:) = retval.modelstats.waic;


%%
%genetics


X = df(:,["age","male","atrx_loss","braf_wt","egfr_amp","hist_wt","idh_mut","mgmt_meth","onep19q_deletion","tert_mut"]);
X = table2array(X);
%y = df.x12month_survival;
y = df(:,["x12month_survival"]);
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x12month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

varnames = {'age','male','atrx_loss','braf_wt','egfr_amp','hist_wt','idh_mut','mgmt_meth','onep19q_deletion','tert_mut'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(49,1:15) = 'linear_genetics';
model_results.prior(49,1:2) = 'hs';
model_results.r2(49,:) = retval.modelstats.r2;
model_results.waic(49,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(50,1:15) = 'linear_genetics';
model_results.prior(50,1:1) = 'g';
model_results.r2(50,:) = retval.modelstats.r2;
model_results.waic(50,:) = retval.modelstats.waic;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(51,1:15) = 'linear_genetics';
model_results.prior(51,1:5) = 'ridge';
model_results.r2(51,:) = retval.modelstats.r2;
model_results.waic(51,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(52,1:15) = 'linear_genetics';
model_results.prior(52,1:5) = 'lasso';
model_results.r2(52,:) = retval.modelstats.r2;
model_results.waic(52,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(53,1:15) = 'linear_genetics';
model_results.prior(53,1:3) = 'hs+';
model_results.r2(53,:) = retval.modelstats.r2;
model_results.waic(53,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'varnames',varnames,'display',true,'catvars',[2,3,4,5,6,7,8,9],'sortrank',true);
model_results.model(54,1:15) = 'linear_genetics';
model_results.prior(54,1:4) = 'logt';
model_results.r2(54,:) = retval.modelstats.r2;
model_results.waic(54,:) = retval.modelstats.waic


%%
nonlinear_df = readtable('/home/jruffle/OneDrive/PhD/JupyterOutputs/neuro_onc_data/2022Results/patientnetwork_OCT/nonlinear_genetics.csv');

y = nonlinear_df(:,["x12month_survival"]);

nonlinear_df.x36month_survival=[];
nonlinear_df.x24month_survival=[];
nonlinear_df.x12month_survival=[];
nonlinear_df.Var1=[];

X = table2array(nonlinear_df);
%y = df.x12month_survival;
outcome = {'Y', 'N'};
outcome_binary = [      1,        0];
[wasfound, idx] = ismember(y.x12month_survival, outcome);
f_values = nan(length(idx), 1);
f_values(wasfound) = outcome_binary(idx(wasfound));
y = f_values;

%varnames = {'age','male','atrx_loss','braf_wt','egfr_amp','hist_wt','idh_mut','mgmt_meth','onep19q_deletion','tert_mut'};

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(55,1:18) = 'nonlinear_genetics';
model_results.prior(55,1:2) = 'hs';
model_results.r2(55,:) = retval.modelstats.r2;
model_results.waic(55,:) = retval.modelstats.waic;


%[beta, beta0, retval] = bayesreg(X,y,'binomial','g','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(56,1:18) = 'nonlinear_genetics';
model_results.prior(56,1:1) = 'g';
model_results.r2(56,:) = 0;
model_results.waic(56,:) = 10000;


[beta, beta0, retval] = bayesreg(X,y,'binomial','ridge','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(57,1:18) = 'nonlinear_genetics';
model_results.prior(57,1:5) = 'ridge';
model_results.r2(57,:) = retval.modelstats.r2;
model_results.waic(57,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','lasso','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(58,1:18) = 'nonlinear_genetics';
model_results.prior(58,1:5) = 'lasso';
model_results.r2(58,:) = retval.modelstats.r2;
model_results.waic(58,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','hs+','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(59,1:18) = 'nonlinear_genetics';
model_results.prior(59,1:3) = 'hs+';
model_results.r2(59,:) = retval.modelstats.r2;
model_results.waic(59,:) = retval.modelstats.waic;

[beta, beta0, retval] = bayesreg(X,y,'binomial','logt','nsamples',nsamples,'burnin',burnin,'thin',5,'displayor',true,'display',true,'sortrank',true);
model_results.model(60,1:18) = 'nonlinear_genetics';
model_results.prior(60,1:4) = 'logt';
model_results.r2(60,:) = retval.modelstats.r2;
model_results.waic(60,:) = retval.modelstats.waic;


%%
%%save results
writetable(model_results,'/home/jruffle/OneDrive/PhD/JupyterOutputs/neuro_onc_data/2022Results/patientnetwork_OCT/bayesreg_survival_results_12months.csv');


