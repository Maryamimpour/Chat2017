clear all
close all
% Baseline or Followup 

BorF='baseline\';
listing = dir(strcat('.\edfs\',BorF));
listing(1,:)=[]; 
listing(1,:)=[];

for IdPateint=1:1
%  BorF='followup\';
%% 1-Preprocessing:
%1- Loading the edf file. 
%2- Storing the required Signals.
%3- Band Pass Filter 1-40 Hz (All Channels? Same Freq?).
%4- Downsample the 512Hz to 256 Hz.
%5- Returnd the preprocessed 

[F3,F4,T3,T4,C3,C4,O1,O2,ECG] = Preprocess(IdPateint,listing);
plot(F3);

%% 2-R peak detection and correction.
[myRpeak] = myQRSdetect(ECG);

%% 3-Removing the events, at this stage to save time.
[EvntFreeRpeak, RRPeakAvg] = RemoveEvent(myRpeak);

end


clear PatientHeader;
clear PatientSignal;
clear NA;
clear fir_coeff;
clear Rpeak;
clear RPeakFilCrct;
clear EEGRPkSeg; 
clear ECGRPkSeg;
