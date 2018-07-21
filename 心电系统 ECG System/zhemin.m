function varargout = zhemin(varargin)
% ZHEMIN MATLAB code for zhemin.fig
%      ZHEMIN, by itself, creates a new ZHEMIN or raises the existing
%      singleton*.
%
%      H = ZHEMIN returns the handle to a new ZHEMIN or the handle to
%      the existing singleton*.
%
%      ZHEMIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZHEMIN.M with the given input arguments.
%
%      ZHEMIN('Property','Value',...) creates a new ZHEMIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zhemin_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zhemin_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zhemin

% Last Modified by GUIDE v2.5 24-Jun-2014 20:29:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zhemin_OpeningFcn, ...
                   'gui_OutputFcn',  @zhemin_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before zhemin is made visible.
function zhemin_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zhemin (see VARARGIN)

% Choose default command line output for zhemin
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zhemin wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zhemin_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when uipanel5 is resized.
function uipanel5_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global OUTECG;
val=get(hObject,'Value');
p=ecg(500)';
ECG=[p;p;p;p;p;p];
load('MIT_ECG.MAT');
M_ECG=MIT_ECG;
switch val
    case 1
    case 2
        OUTECG=ECG;
    case 3
        OUTECG=M_ECG;
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OUTECG;
global noise;
global N_ECG;
FS=360;i=1:3000;
noise1=sin(2*pi*0.5* i/FS);
noise2=sin(2*pi*50* i/FS);
val1=get(hObject,'Value');
switch val1
    case 1
    case 2
        N_ECG=OUTECG+noise1';
        noise=noise1';
    case 3
        N_ECG=OUTECG+noise2';
        noise=noise2;
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
global ECGout;
val=get(hObject,'Value');
p=ecg(500)';
ECG=[p;p;p;p;p;p];
load('MIT_ECG.MAT');
M_ECG=MIT_ECG;
FS=360;i=1:3000;
noise1=sin(2*pi*0.5* i/FS);
noise2=sin(2*pi*50* i/FS);
switch val
    case 1
    case 2
        ECGout=ECG+noise1'+noise2';
    case 3
        ECGout=M_ECG+noise1'+noise2';
end


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5
global val5;
val5=get(hObject,'Value');


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OUTECG;
axes(handles.axes1)
cla;
plot(OUTECG),title('原始信号','Color','r','FontSize',8);

% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global noise;
global N_ECG;
axes(handles.axes2);
cla;
plot(noise),title('所加噪声','Color','r','FontSize',8);
axes(handles.axes9)
cla;
plot(N_ECG),title('加噪信号','Color','r','FontSize',8);


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val2;
val2=get(hObject,'Value');

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global N_ECG;
global val2;
N=length(N_ECG);
q=zeros(N,1);
for k=1:N
    q(k,1)=N_ECG(k,1);
end
d=q';
s1=d;
% figure(1),subplot(4,1,2),plot(noise_2'),title('0.5HZ 正弦基线漂移干扰');
[c,l]=wavedec(d,7,'coif4');
A1=wrcoef('a',c,l,'coif4',1);
A2=wrcoef('a',c,l,'coif4',2);
A3=wrcoef('a',c,l,'coif4',3);
A4=wrcoef('a',c,l,'coif4',4);
A5=wrcoef('a',c,l,'coif4',5);
A6=wrcoef('a',c,l,'coif4',6);
A7=wrcoef('a',c,l,'coif4',7);
D1=wrcoef('d',c,l,'coif4',1);
D2=wrcoef('d',c,l,'coif4',2);
D3=wrcoef('d',c,l,'coif4',3);
D4=wrcoef('d',c,l,'coif4',4);
D5=wrcoef('d',c,l,'coif4',5);
D6=wrcoef('d',c,l,'coif4',6);
D7=wrcoef('d',c,l,'coif4',7);
ca1=appcoef(c,l,'coif4',1);%低频
ca2=appcoef(c,l,'coif4',2);
ca3=appcoef(c,l,'coif4',3);
ca4=appcoef(c,l,'coif4',4);
ca5=appcoef(c,l,'coif4',5);
ca6=appcoef(c,l,'coif4',6);
ca7=appcoef(c,l,'coif4',7);
cd4=detcoef(c,l,4);%高频小波系数
cd3=detcoef(c,l,3);
cd2=detcoef(c,l,2);
cd7=detcoef(c,l,7);
cd5=detcoef(c,l,5);
cd6=detcoef(c,l,6);
cd1=detcoef(c,l,1);
cad7=zeros(1,length(ca7));%将第七层噪声信号滤除
c1=[cad7,cd7,cd6,cd5,cd4,cd3,cd2,cd1];%构建新的系数矩阵
s2=waverec(c1,l,'coif4');%分解新的结构
lenD3=length(cd3);
lenD2=length(cd2);
lenD1=length(cd1);
var1=median(abs(cd1));
var2=median(abs(cd2));
var3=median(abs(cd3));
t1=(2*log(lenD1)).^0.5;
t2=(2*log(lenD2)).^0.5;
t3=(2*log(lenD3)).^0.5;
th1=var1*t1/log(2)
th2=var2*t2/log(2)
th3=var3*t3/log(2)
for k=1:lenD1
    if abs(cd1(k))<=th1
        cdd1(k)=0;
    else
        cdd1(k)=sign(cd1(k))*(abs(cd1(k))-th1);
    end
end
for k=1:lenD2
    if abs(D2(k))<=th2
        cdd2(k)=0;
    else
        cdd2(k)=sign(cd2(k))*(abs(cd2(k))-th2);
    end
end
for k=1:lenD3
    if abs(cd3(k))<=th3
        cdd3(k)=0;
    else
        cdd3(k)=sign(cd3(k))*(abs(cd3(k))-th3);
    end
end
cl2=[ca7,cd7,cd6,cd5,cd4,cdd3,cdd2,cdd1];%构建新的系数矩阵
s3=waverec(cl2,l,'coif4');%分解新的结构
lencDd7=length(cd7);
lencDd6=length(cd6);
lencDd5=length(cd5);
lencDd4=length(cd4);
var5=median(abs(cd5));
var6=median(abs(cd6));
var7=median(abs(cd7));
var4=median(abs(cd4));
t5=(2*log(lencDd5)).^0.5;
t6=(2*log(lencDd6)).^0.5;
t7=(2*log(lencDd7)).^0.5;
t4=(2*log(lencDd4)).^0.5;
th5=var5*t5/log(2)
th6=var6*t6/log(2)
th7=var7*t7/log(2)
th4=var4*t4/log(2)
for k=1:lencDd5
    if abs(cd5(k))<=th5
        cdd5(k)=0;
    else
        cdd5(k)=sign(cd5(k))*(abs(cd5(k))-0.1*th5);
    end
end
for k=1:lencDd6
    if abs(cd6(k))<=th6
        cdd6(k)=0;
    else
        cdd6(k)=sign(cd6(k))*(abs(cd6(k))-0.1*th6);
    end
end
for k=1:lencDd7
    if abs(cd7(k))<=th7
        cdd7(k)=0;
    else
        cdd7(k)=sign(cd7(k))*(abs(cd7(k))-0.1*th7);
    end
end
for k=1:lencDd4
    if abs(cd4(k))<=th4
        cdd4(k)=0;
    else
        cdd4(k)=sign(cd4(k))*(abs(cd4(k))-0.1*th4);
    end
end
cl4=[ca7,cdd7,cdd6,cdd5,cdd4,cd3,cdd2,cdd1];%构建新的系数矩阵
s4=waverec(cl4,l,'coif4');%分解新的结构
switch val2
    case 1
    case 2
        axes(handles.axes10);
        cla;
        plot(s2),title('去除基线漂移','Color','r','FontSize',8);
        axes(handles.axes11);
        cla;
        plot(A6),ylabel('level 6','Color','r','FontSize',8);
        axes(handles.axes12);
        cla;
        plot(A7),ylabel('level 7','Color','r','FontSize',8);
         axes(handles.axes13)
        cla;
        plot(D1),ylabel('level 1','Color','r','FontSize',8);
        axes(handles.axes14)
        cla;
        plot(D2),ylabel('level 2','Color','r','FontSize',8);
    case 3
        axes(handles.axes10)
        cla;
        plot(s3),title('去除工频干扰','Color','r','FontSize',8);
        axes(handles.axes11)
        cla;
        plot(A6),ylabel('level 6','Color','r','FontSize',8);
        axes(handles.axes12)
        cla;
        plot(A7),ylabel('level 7','Color','r','FontSize',8);
        axes(handles.axes13)
        cla;
        plot(D2),ylabel('level 2','Color','r','FontSize',8);
        axes(handles.axes14)
        cla;
        plot(D3),ylabel('level 4','Color','r','FontSize',8);
    case 4
        axes(handles.axes10)
        cla;
        cl5=[cad7,cdd7,cdd6,cdd5,cdd4,cd3,cdd2,cdd1];%构建新的系数矩阵
        s5=waverec(cl5,l,'coif4');%分解新的结构
        plot(s5),title('去除肌电干扰','Color','r','FontSize',8);
        axes(handles.axes11);
        cla;
        plot(D4),ylabel('level 4','Color','r','FontSize',8);
        axes(handles.axes12)
        cla;
        plot(D5),ylabel('level 5','Color','r','FontSize',8);
         axes(handles.axes13)
        cla;
        plot(D6),ylabel('level 6','Color','r','FontSize',8);
        axes(handles.axes14)
        cla;
        plot(D7),ylabel('level 7','Color','r','FontSize',8);
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ECGout;
axes(handles.axes1)
cla;
plot(ECGout),title('噪声信号','Color','r','FontSize',8);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ECGout;
global val5;
global outs3;
global outs4;
N=length(ECGout);
q=zeros(N,1);
for k=1:N
    q(k,1)=ECGout(k,1);
end
d=q';
s1=d;
% figure(1),subplot(4,1,2),plot(noise_2'),title('0.5HZ 正弦基线漂移干扰');
[c,l]=wavedec(d,7,'coif4');
A1=wrcoef('a',c,l,'coif4',1);
A2=wrcoef('a',c,l,'coif4',2);
A3=wrcoef('a',c,l,'coif4',3);
A4=wrcoef('a',c,l,'coif4',4);
A5=wrcoef('a',c,l,'coif4',5);
A6=wrcoef('a',c,l,'coif4',6);
A7=wrcoef('a',c,l,'coif4',7);
D1=wrcoef('d',c,l,'coif4',1);
D2=wrcoef('d',c,l,'coif4',2);
D3=wrcoef('d',c,l,'coif4',3);
D4=wrcoef('d',c,l,'coif4',4);
D5=wrcoef('d',c,l,'coif4',5);
D6=wrcoef('d',c,l,'coif4',6);
D7=wrcoef('d',c,l,'coif4',7);
ca1=appcoef(c,l,'coif4',1);%低频
ca2=appcoef(c,l,'coif4',2);
ca3=appcoef(c,l,'coif4',3);
ca4=appcoef(c,l,'coif4',4);
ca5=appcoef(c,l,'coif4',5);
ca6=appcoef(c,l,'coif4',6);
ca7=appcoef(c,l,'coif4',7);
cd4=detcoef(c,l,4);%高频小波系数
cd3=detcoef(c,l,3);
cd2=detcoef(c,l,2);
cd7=detcoef(c,l,7);
cd5=detcoef(c,l,5);
cd6=detcoef(c,l,6);
cd1=detcoef(c,l,1);
cad7=zeros(1,length(ca7));%将第七层噪声信号滤除
c1=[cad7,cd7,cd6,cd5,cd4,cd3,cd2,cd1];%构建新的系数矩阵
s2=waverec(c1,l,'coif4');%分解新的结构
lenD3=length(cd3);
lenD2=length(cd2);
lenD1=length(cd1);
var1=median(abs(cd1));
var2=median(abs(cd2));
var3=median(abs(cd3));
t1=(2*log(lenD1)).^0.5;
t2=(2*log(lenD2)).^0.5;
t3=(2*log(lenD3)).^0.5;
th1=var1*t1/log(2)
th2=var2*t2/log(2)
th3=var3*t3/log(2)
for k=1:lenD1
    if abs(cd1(k))<=th1
        cdd1(k)=0;
    else
        cdd1(k)=sign(cd1(k))*(abs(cd1(k))-th1);
    end
end
for k=1:lenD2
    if abs(D2(k))<=th2
        cdd2(k)=0;
    else
        cdd2(k)=sign(cd2(k))*(abs(cd2(k))-th2);
    end
end
for k=1:lenD3
    if abs(cd3(k))<=th3
        cdd3(k)=0;
    else
        cdd3(k)=sign(cd3(k))*(abs(cd3(k))-th3);
    end
end
cl2=[cad7,cd7,cd6,cd5,cd4,cdd3,cdd2,cdd1];%构建新的系数矩阵
s3=waverec(cl2,l,'coif4');%分解新的结构
outs3=s3;
lencDd7=length(cd7);
lencDd6=length(cd6);
lencDd5=length(cd5);
lencDd4=length(cd4);
var5=median(abs(cd5));
var6=median(abs(cd6));
var7=median(abs(cd7));
var4=median(abs(cd4));
t5=(2*log(lencDd5)).^0.5;
t6=(2*log(lencDd6)).^0.5;
t7=(2*log(lencDd7)).^0.5;
t4=(2*log(lencDd4)).^0.5;
th5=var5*t5/log(2)
th6=var6*t6/log(2)
th7=var7*t7/log(2)
th4=var4*t4/log(2)
for k=1:lencDd5
    if abs(cd5(k))<=th5
        cdd5(k)=0;
    else
        cdd5(k)=sign(cd5(k))*(abs(cd5(k))-0.1*th5);
    end
end
for k=1:lencDd6
    if abs(cd6(k))<=th6
        cdd6(k)=0;
    else
        cdd6(k)=sign(cd6(k))*(abs(cd6(k))-0.1*th6);
    end
end
for k=1:lencDd7
    if abs(cd7(k))<=th7
        cdd7(k)=0;
    else
        cdd7(k)=sign(cd7(k))*(abs(cd7(k))-0.1*th7);
    end
end
for k=1:lencDd4
    if abs(cd4(k))<=th4
        cdd4(k)=0;
    else
        cdd4(k)=sign(cd4(k))*(abs(cd4(k))-0.1*th4);
    end
end
cl4=[cad7,cdd7,cdd6,cdd5,cdd4,cdd3,cdd2,cdd1];%构建新的系数矩阵
s4=waverec(cl4,l,'coif4');%分解新的结构
outs4=s4;
switch val5
    case 1
    case 2
        axes(handles.axes2);
        cla;
        plot(s2),title('去除基线漂移','Color','r','FontSize',8);
        axes(handles.axes11);
        cla;
        plot(A6),ylabel('level 6','Color','r','FontSize',8);
        axes(handles.axes12);
        cla;
        plot(A7),ylabel('level 7','Color','r','FontSize',8);
         axes(handles.axes13)
        cla;
        plot(D1),ylabel('level 1','Color','r','FontSize',8);
        axes(handles.axes14)
        cla;
        plot(D2),ylabel('level 2','Color','r','FontSize',8);
    case 3
        axes(handles.axes9)
        cla;
        plot(s3),title('去除工频干扰','Color','r','FontSize',8);
        axes(handles.axes11)
        cla;
        plot(A6),ylabel('level 6','Color','r','FontSize',8);
        axes(handles.axes12)
        cla;
        plot(A7),ylabel('level 7','Color','r','FontSize',8);
        axes(handles.axes13)
        cla;
        plot(D2),ylabel('level 2','Color','r','FontSize',8);
        axes(handles.axes14)
        cla;
        plot(D3),ylabel('level 4','Color','r','FontSize',8);
    case 4
        axes(handles.axes10)
        cla;
        plot(s4),title('去除肌电干扰','Color','r','FontSize',8);
        axes(handles.axes11);
        cla;
        plot(D4),ylabel('level 4','Color','r','FontSize',8);
        axes(handles.axes12)
        cla;
        plot(D5),ylabel('level 5','Color','r','FontSize',8);
         axes(handles.axes13)
        cla;
        plot(D6),ylabel('level 6','Color','r','FontSize',8);
        axes(handles.axes14)
        cla;
        plot(D7),ylabel('level 7','Color','r','FontSize',8);
end



% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7
global val7;
val7=get(hObject,'Value');


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val7;
global outs3;
global outs4;
switch val7
    case 1
    case 2
        axes(handles.axes10)
        cla;
        plot(outs3),title('仿真信号最终滤除效果','Color','r','FontSize',8);
    case 3
        axes(handles.axes10)
        cla;
        plot(outs4),title('MIT信号最终滤除效果','Color','r','FontSize',8);
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sqr_detectation;


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
untitled;


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sqr_detectation;


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
