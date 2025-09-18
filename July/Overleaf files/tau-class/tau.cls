%%%%%%%%
% TAU CLASS DOCUMENT FORMATTING

%
%
%
%
%
%
%
%

%


%-------------------------------------------------
% Class configuration
%--------------------------------------------------

\NeedsTeXFormat{LaTeX2e}  %ensures LaTeX2e is the engine format (normal modern LaTex)

%declares the file as tau class
\ProvidesClass{tau-class/tau}[2025/02/28 Tau LaTeX class]

% any option passed to this class (11pt, 2 column) is forwarded to extarticle base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax  %process all declared options
\LoadClass{extarticle}   %load extarticle (variation of article that supports more font sizes)
\AtEndOfClass{\RequirePackage{microtype}} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  REQUIRED PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[utf8]{inputenc}   
\RequirePackage{etoolbox}
\RequirePackage[framemethod=tikz]{mdframed}
\RequirePackage{titling}
\RequirePackage{lettrine}
\RequirePackage[switch]{lineno}
\RequirePackage[bottom,hang,flushmargin,ragged]{footmisc}
\RequirePackage{fancyhdr}
\RequirePackage{xifthen}
\RequirePackage{adjustbox}
\RequirePackage{adforn}
\RequirePackage{lastpage}
\RequirePackage[explicit]{titlesec}
\RequirePackage{booktabs}
\RequirePackage{array} 
\RequirePackage{caption}
\RequirePackage{setspace}
\RequirePackage{iflang}
\RequirePackage{listings}
\RequirePackage{lipsum}
\RequirePackage{fontawesome5}    % For icons
\RequirePackage{chemfig}         % Chemical structures
\RequirePackage{circuitikz}      % Circuits schematics
\RequirePackage{supertabular}
\RequirePackage{matlab-prettifier}
\RequirePackage{listings}
\RequirePackage{csquotes}
\RequirePackage{ragged2e}
\RequirePackage{subcaption}
\RequirePackage{stfloats} 
% \RequirePackage{pbalance} 

%----------------------------------------------------------
% TAU CUSTOM PACKAGES (location/name)
%----------------------------------------------------------

\RequirePackage{tau-class/tauenvs}
\RequirePackage{tau-class/taubabel}

%----------------------------------------------------------
% PACKAGES FOR FIGURES
%----------------------------------------------------------

\usepackage{graphicx}
\RequirePackage{here}
\graphicspath{{figures/}{./}} 

%----------------------------------------------------------
% PACKAGES FOR TABLES
%----------------------------------------------------------

\usepackage{adjustbox}
\RequirePackage{colortbl}
\RequirePackage{tcolorbox}

%----------------------------------------------------------
% GEOMETRY PACKAGE SETUP
%----------------------------------------------------------

\RequirePackage[
left = 1.25cm,
right = 1.25cm,
top = 2cm,
bottom = 2cm,
headsep = 0.75cm
]{geometry}


%----------------------------------------------------------
% MATH PACKAGES
%----------------------------------------------------------

%!TEX In case of using another font that is not stix2 uncomment 'amssymb'

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{mathtools}
% \RequirePackage{amssymb}


%----------------------------------------------------------
% MATH PACKAGES
%----------------------------------------------------------

%!TEX In case of using another font that is not stix2 uncomment 'amssymb'

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{mathtools}
% \RequirePackage{amssymb}

% Equation skip value
\newlength{\eqskip}\setlength{\eqskip}{8pt}
\expandafter\def\expandafter\normalsize\expandafter{%
    \normalsize%
    \setlength\abovedisplayskip{\eqskip}%
    \setlength\belowdisplayskip{\eqskip}%
    \setlength\abovedisplayshortskip{\eqskip-\baselineskip}%
    \setlength\belowdisplayshortskip{\eqskip}%
}

%----------------------------------------------------------
% FONTS
%----------------------------------------------------------

\usepackage[notextcomp]{stix2}
\RequirePackage[scaled]{helvet}
\renewcommand{\ttdefault}{lmtt}
% \renewcommand{\ttdefault}{zi4}
% \renewcommand{\ttdefault}{txtt}
% \renewcommand{\ttdefault}{cmtl}

%----------------------------------------------------------
% URLs STYLE
%----------------------------------------------------------

\RequirePackage{url}
\RequirePackage{xurl}
\renewcommand\UrlFont{\selectfont}

%----------------------------------------------------------

\RequirePackage[colorlinks=true,allcolors=taucolor]{hyperref}
\RequirePackage{cleveref}
\RequirePackage{bookmark}

%----------------------------------------------------------
% ITEMS
%----------------------------------------------------------

\RequirePackage{enumitem}
\setlist{noitemsep}

%----------------------------------------------------------
% PREDEFINED LENGTHS
%----------------------------------------------------------

\setlength{\columnsep}{15pt}
