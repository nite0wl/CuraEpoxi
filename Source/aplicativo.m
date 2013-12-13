function varargout = aplicativo(varargin)
% APLICATIVO MATLAB code for aplicativo.fig
%      APLICATIVO, by itself, creates a new APLICATIVO or raises the existing
%      singleton*.
%
%      H = APLICATIVO returns the handle to a new APLICATIVO or the handle to
%      the existing singleton*.
%
%      APLICATIVO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APLICATIVO.M with the given input arguments.
%
%      APLICATIVO('Property','Value',...) creates a new APLICATIVO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before aplicativo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to aplicativo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help aplicativo

% Last Modified by GUIDE v2.5 12-Dec-2013 14:06:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @aplicativo_OpeningFcn, ...
                   'gui_OutputFcn',  @aplicativo_OutputFcn, ...
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


% --- Executes just before aplicativo is made visible.
function aplicativo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to aplicativo (see VARARGIN)

% Choose default command line output for aplicativo
handles.output = hObject;

%Procedural
handles.tolerance=1e-2;
tolerance=handles.tolerance;


%Process
handles.temp_lim=423.15;
temp_lim=handles.temp_lim;
set(handles.edittemp_lim,'String',num2str(temp_lim));

handles.wait=300;
wait=handles.wait;
set(handles.editwait,'String',num2str(wait));

handles.temp_fin=310.15;
temp_fin=handles.temp_fin;
set(handles.edittemp_fin,'String',num2str(temp_fin));

handles.Tinit=298.15;
Tinit=handles.Tinit;
set(handles.editTinit,'String',num2str(Tinit));

handles.em=0.8;
em=handles.em;
set(handles.editem,'String',num2str(em));

handles.L=1.5e-3;
L=handles.L;
set(handles.editL,'String',num2str(L));

%Material
handles.K=177;
K=handles.K;
set(handles.editK,'String',num2str(K));

handles.C=875;
C=handles.C;
set(handles.editC,'String',num2str(C));

handles.d=2770;
d=handles.d;
set(handles.editd,'String',num2str(d));

%Heating
handles.TsurH=448.15;
TsurH=handles.TsurH;
set(handles.editTsurH,'String',num2str(TsurH));

handles.TinfH=448.15;
TinfH=handles.TinfH;
set(handles.editTinfH,'String',num2str(TinfH));

handles.hH=40;
hH=handles.hH;
set(handles.edithH,'String',num2str(hH));


%Cooling
handles.TsurC=298.15;
TsurC=handles.TsurC;
set(handles.editTsurC,'String',num2str(TsurC));

handles.TinfC=298.15;
TinfC=handles.TinfC;
set(handles.editTinfC,'String',num2str(TinfC));

handles.hC=10;
hC=handles.hC;
set(handles.edithC,'String',num2str(hC));


%Evaluate Heating
init=[Tinit,hH,TsurH,TinfH,C,d,em,L];
[x1,y1,tc]=cure(init,0,temp_lim,wait,tolerance,1);
set(handles.tc,'String',['Tc=',num2str(tc)]);


%Evaluate Cooling
init=[y1(length(y1)),hC,TsurC,TinfC,C,d,em,L];
[x2,y2,tt]=cure(init,x1(length(x1)),temp_fin,0,tolerance,0);
set(handles.tt,'String',['Tt=',num2str(tt)]);

x=[x1;x2];
y=[y1(:,1);y2(:,1)];
plot(x,y); grid on;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes aplicativo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = aplicativo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edittemp_lim_Callback(hObject, eventdata, handles)
% hObject    handle to edittemp_lim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edittemp_lim as text
%        str2double(get(hObject,'String')) returns contents of edittemp_lim as a double
handles.temp_lim=str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edittemp_lim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edittemp_lim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editwait_Callback(hObject, eventdata, handles)
% hObject    handle to editwait (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editwait as text
%        str2double(get(hObject,'String')) returns contents of editwait as a double
handles.wait=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function editwait_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editwait (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edittemp_fin_Callback(hObject, eventdata, handles)
% hObject    handle to edittemp_fin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edittemp_fin as text
%        str2double(get(hObject,'String')) returns contents of edittemp_fin as a double
handles.temp_fin=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edittemp_fin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edittemp_fin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editK_Callback(hObject, eventdata, handles)
% hObject    handle to editK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editK as text
%        str2double(get(hObject,'String')) returns contents of editK as a double
handles.K=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function editK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editC_Callback(hObject, eventdata, handles)
% hObject    handle to editC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editC as text
%        str2double(get(hObject,'String')) returns contents of editC as a double
handles.C=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function editC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editd_Callback(hObject, eventdata, handles)
% hObject    handle to editd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editd as text
%        str2double(get(hObject,'String')) returns contents of editd as a double
handles.d=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function editd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTsurC_Callback(hObject, eventdata, handles)
% hObject    handle to editTsurC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTsurC as text
%        str2double(get(hObject,'String')) returns contents of editTsurC as a double
handles.TsurC=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function editTsurC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTsurC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTinfC_Callback(hObject, eventdata, handles)
% hObject    handle to editTinfC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTinfC as text
%        str2double(get(hObject,'String')) returns contents of editTinfC as a double
handles.TinfC=str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function editTinfC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTinfC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edithC_Callback(hObject, eventdata, handles)
% hObject    handle to edithC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edithC as text
%        str2double(get(hObject,'String')) returns contents of edithC as a double
handles.hC=str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edithC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edithC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTsurH_Callback(hObject, eventdata, handles)
% hObject    handle to editTsurH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTsurH as text
%        str2double(get(hObject,'String')) returns contents of editTsurH as a double
handles.TsurH=str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function editTsurH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTsurH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTinfH_Callback(hObject, eventdata, handles)
% hObject    handle to editTinfH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTinfH as text
%        str2double(get(hObject,'String')) returns contents of editTinfH as a double
handles.TinfH=str2double(get(hObject,'String'));
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function editTinfH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTinfH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edithH_Callback(hObject, eventdata, handles)
% hObject    handle to edithH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edithH as text
%        str2double(get(hObject,'String')) returns contents of edithH as a double
handles.hH=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edithH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edithH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Data
temp_lim=handles.temp_lim;
tolerance=handles.tolerance;
wait=handles.wait;
temp_fin=handles.temp_fin;
Tinit=handles.Tinit;
em=handles.em;
L=handles.L;
K=handles.K;
C=handles.C;
d=handles.d;
TsurH=handles.TsurH;
TinfH=handles.TinfH;
hH=handles.hH;
TsurC=handles.TsurC;
TinfC=handles.TinfC;
hC=handles.hC;


%Evaluate Heating
init=[Tinit,hH,TsurH,TinfH,C,d,em,L];
[x1,y1,tc]=cure(init,0,temp_lim,wait,tolerance,1);
set(handles.tc,'String',['Tc=',num2str(tc)]);


%Evaluate Cooling
init=[y1(length(y1)),hC,TsurC,TinfC,C,d,em,L];
[x2,y2,tt]=cure(init,x1(length(x1)),temp_fin,0,tolerance,0);
set(handles.tt,'String',['Tt=',num2str(tt)]);


x=[x1;x2];
y=[y1(:,1);y2(:,1)];
plot(x,y); grid on;

    



function editem_Callback(hObject, eventdata, handles)
% hObject    handle to editem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editem as text
%        str2double(get(hObject,'String')) returns contents of editem as a double
handles.em=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function editem_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editL_Callback(hObject, eventdata, handles)
% hObject    handle to editL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editL as text
%        str2double(get(hObject,'String')) returns contents of editL as a double
handles.L=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function editL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTinit_Callback(hObject, eventdata, handles)
% hObject    handle to editTinit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTinit as text
%        str2double(get(hObject,'String')) returns contents of editTinit as a double
handles.Tinit=str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function editTinit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTinit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
