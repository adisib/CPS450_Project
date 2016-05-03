function varargout = bungeegui(varargin)
% BUNGEEGUI MATLAB code for bungeegui.fig
%      BUNGEEGUI, by itself, creates a new BUNGEEGUI or raises the existing
%      singleton*.
%
%      H = BUNGEEGUI returns the handle to a new BUNGEEGUI or the handle to
%      the existing singleton*.
%
%      BUNGEEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BUNGEEGUI.M with the given input arguments.
%
%      BUNGEEGUI('Property','Value',...) creates a new BUNGEEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bungeegui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bungeegui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bungeegui

% Last Modified by GUIDE v2.5 13-Apr-2016 14:06:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bungeegui_OpeningFcn, ...
                   'gui_OutputFcn',  @bungeegui_OutputFcn, ...
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


% --- Executes just before bungeegui is made visible.
function bungeegui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no messageOutput args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bungeegui (see VARARGIN)

% Choose default command line messageOutput for bungeegui
handles.messageOutput = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bungeegui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bungeegui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning messageOutput args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line messageOutput from handles structure
varargout{1} = handles.messageOutput;



function maxVelocity_Callback(hObject, eventdata, handles)
% hObject    handle to maxVelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxVelocity as text
%        str2double(get(hObject,'String')) returns contents of maxVelocity as a double


% --- Executes during object creation, after setting all properties.
function maxVelocity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxVelocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initialLength_Callback(hObject, eventdata, handles)
% hObject    handle to initialLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initialLength as text
%        str2double(get(hObject,'String')) returns contents of initialLength as a double


% --- Executes during object creation, after setting all properties.
function initialLength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initialLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function equilibriumLength_Callback(hObject, eventdata, handles)
% hObject    handle to equilibriumLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of equilibriumLength as text
%        str2double(get(hObject,'String')) returns contents of equilibriumLength as a double


% --- Executes during object creation, after setting all properties.
function equilibriumLength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to equilibriumLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxLength_Callback(hObject, eventdata, handles)
% hObject    handle to maxLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxLength as text
%        str2double(get(hObject,'String')) returns contents of maxLength as a double


% --- Executes during object creation, after setting all properties.
function maxLength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cordMass_Callback(hObject, eventdata, handles)
% hObject    handle to cordMass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cordMass as text
%        str2double(get(hObject,'String')) returns contents of cordMass as a double


% --- Executes during object creation, after setting all properties.
function cordMass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cordMass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jumperMass_Callback(hObject, eventdata, handles)
% hObject    handle to jumperMass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jumperMass as text
%        str2double(get(hObject,'String')) returns contents of jumperMass as a double


% --- Executes during object creation, after setting all properties.
function jumperMass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jumperMass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function modulus_Callback(hObject, eventdata, handles)
% hObject    handle to modulus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of modulus as text
%        str2double(get(hObject,'String')) returns contents of modulus as a double


% --- Executes during object creation, after setting all properties.
function modulus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to modulus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function paramK_Callback(hObject, eventdata, handles)
% hObject    handle to paramK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of paramK as text
%        str2double(get(hObject,'String')) returns contents of paramK as a double


% --- Executes during object creation, after setting all properties.
function paramK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to paramK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function paramN_Callback(hObject, eventdata, handles)
% hObject    handle to paramN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of paramN as text
%        str2double(get(hObject,'String')) returns contents of paramN as a double


% --- Executes during object creation, after setting all properties.
function paramN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to paramN (see GCBO)
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

% Supress some warnings from solver
w = warning('query','symbolic:mupadmex:MuPADTextWarning');
warning('off', 'symbolic:mupadmex:MuPADTextWarning');

set(handles.messageOut, 'String', 'Computing...');

% grab inputs
bungeeData.area = pi*(str2double(get(handles.diameter, 'String'))/2).^2;
bungeeData.maxVelocity = str2double(get(handles.maxVelocity, 'String'));
bungeeData.initialLength = str2double(get(handles.initialLength, 'String'));
bungeeData.equilibriumLength = str2double(get(handles.equilibriumLength, 'String'));
bungeeData.maxLength = str2double(get(handles.maxLength, 'String'));
bungeeData.cordMass = str2double(get(handles.cordMass, 'String'));
bungeeData.jumperMass = str2double(get(handles.jumperMass, 'String'));
bungeeData.modulus = str2double(get(handles.modulus, 'String'));
bungeeData.paramK = str2double(get(handles.paramK, 'String'));
bungeeData.paramN = str2double(get(handles.paramN, 'String'));
% non-input values
bungeeData.velocity = NaN;
bungeeData.length = NaN;
bungeeData.time = NaN;

% Calculate values
newBungeeData = bungeecalc(bungeeData);

% Create graphs and stuff if requested
doVis = get(handles.checkbox1, 'Value');
if doVis
bungeevis(newBungeeData);
end

% round to 2 decimal places?
set(handles.diameter, 'String', num2str(sqrt(newBungeeData.area/pi)*2));
set(handles.maxVelocity, 'String', num2str(newBungeeData.maxVelocity));
set(handles.initialLength, 'String', num2str(newBungeeData.initialLength));
set(handles.equilibriumLength, 'String', num2str(newBungeeData.equilibriumLength));
set(handles.maxLength, 'String', num2str(newBungeeData.maxLength));
set(handles.cordMass, 'String', num2str(newBungeeData.cordMass));
set(handles.jumperMass, 'String', num2str(newBungeeData.jumperMass));
set(handles.modulus, 'String', num2str(newBungeeData.modulus));
set(handles.paramK, 'String', num2str(newBungeeData.paramK));
set(handles.paramN, 'String', num2str(newBungeeData.paramN));

set(handles.messageOut, 'String', 'Computation finished.');

% reset warnings to before
warning(w.state, w.identifier);


function diameter_Callback(hObject, eventdata, handles)
% hObject    handle to diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of diameter as text
%        str2double(get(hObject,'String')) returns contents of diameter as a double


% --- Executes during object creation, after setting all properties.
function diameter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function messageOut_CreateFcn(hObject, eventdata, handles)
% hObject    handle to messageOut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
