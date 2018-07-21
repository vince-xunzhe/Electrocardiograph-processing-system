function varargout = sqr_detectation(varargin)
% SQR_DETECTATION MATLAB code for sqr_detectation.fig
%      SQR_DETECTATION, by itself, creates a new SQR_DETECTATION or raises the existing
%      singleton*.
%
%      H = SQR_DETECTATION returns the handle to a new SQR_DETECTATION or the handle to
%      the existing singleton*.
%
%      SQR_DETECTATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SQR_DETECTATION.M with the given input arguments.
%
%      SQR_DETECTATION('Property','Value',...) creates a new SQR_DETECTATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sqr_detectation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sqr_detectation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sqr_detectation

% Last Modified by GUIDE v2.5 24-Jun-2014 20:11:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sqr_detectation_OpeningFcn, ...
                   'gui_OutputFcn',  @sqr_detectation_OutputFcn, ...
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


% --- Executes just before sqr_detectation is made visible.
function sqr_detectation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sqr_detectation (see VARARGIN)

% Choose default command line output for sqr_detectation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sqr_detectation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sqr_detectation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f
global d
global r
x=ecg(500)
f=[x x x x x x]
a=size(f);
d=zeros(a);
for i=1:a(2)
    if (i>5 & i<(a(2)-5))
        d(i)=2*f(i)-f(i+1)-f(i-1);
    else
        d(i)=0;
    end
end
j=0;
k=0;
r=zeros(a);
dmax=max(d)*0.695;
for i=1:a(2)
    if (d(i)>=dmax) 
    j=i-36;
    k=i+36;
    for i=j:k
     r(i)=f(i);
    end
  end
end
axes(handles.axes1)
cla;
plot(f)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d
global r
axes(handles.axes2)
cla;
plot(d)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global d
global r
axes(handles.axes3)
cla;
plot(r)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
compare;


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
