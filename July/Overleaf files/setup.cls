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
\graphicspath{{Figures/}{./}} 

%----------------------------------------------------------
% PACKAGES FOR TABLES
%----------------------------------------------------------

\usepackage{adjustbox}
\RequirePackage{colortbl}
\RequirePackage{tcolorbox}
%----------------------------------------------------------
% COLORS
%----------------------------------------------------------

\RequirePackage{xcolor}
\definecolor{taucolor}{rgb}{0.0,0.2,0.4}        
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


% New commands
\newcommand{\footerfont}{\normalfont\sffamily\fontsize{7}{9}\selectfont}
\newcommand{\institution}[1]{\def\@institution{#1}}
\newcommand{\footinfo}[1]{\def\@footinfo{#1}}
\newcommand{\leadauthor}[1]{\def\@leadauthor{#1}}
\newcommand{\course}[1]{\def\@course{#1}}
\newcommand{\theday}[1]{\def\@theday{#1}}
\pagestyle{fancy}

%In the above, we prescribe footer font:
%       *normal font | San-serif | fontsize (7pt), linespacing (9pt)
%       *define new commands: eg institution, footinfo, leadauthor etc
%       *\newcommand{name}{properties}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             First page style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fancypagestyle{firststyle}{
    \fancyfoot[R]{
        {\ifx\@institution\undefined\else\footerfont\@institution\hspace{10pt}\fi}
        {\ifx\@theday\undefined\else\footerfont\bfseries\@theday\hspace{10pt}\fi}
        {\ifx\@footinfo\undefined\else\footerfont\@footinfo\hspace{10pt}\fi}
        \footerfont\textbf{\thepage\textendash\pageref{LastPage}}
    }
    \fancyfoot[L]{\ifx\@course\undefined\else\footerfont\@course\fi}
    \fancyhead[C]{}
    \fancyhead[R]{}
    \fancyhead[L]{}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              Every other page formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fancy head
\fancyhead[C]{}
\fancyhead[RE]{\footerfont\itshape\@title}
\fancyhead[RO]{}
\fancyhead[LO]{\footerfont\itshape\@title}
\fancyhead[LE]{}

% At the right header (even pages), print the title in footerfont style (not bold)
% At the left header (odd pages), print the title,= in footerfont style

%Cleared header at center, and right (odd) left (even)

% Fancy foot
\fancyfoot[C]{}
\fancyfoot[LE]{\footerfont\textbf{\thepage}\hspace{10pt}\ifx\@course\undefined\else\@course\fi}
\fancyfoot[RO]{\footerfont\ifx\@course\undefined\else\@course\hspace{10pt}\fi\textbf{\thepage}}
\fancyfoot[RE,LO]{\footerfont\ifx\@leadauthor\undefined\else\itshape\@leadauthor\fi}

% Footer at following pages will print the COURSE item at the left (even) and right (odd)
%right (even) and left (odd) will print LEADAUTHOR item

% Head and foot rule
\renewcommand{\headrulewidth}{0pt}      % No header rule
\renewcommand{\footrulewidth}{0pt}      % No footer rule


%----------------------------------------------------------
% TAU START ~ LETTRINE
%----------------------------------------------------------

\RequirePackage{lettrine}
\newcommand{\dropcapfont}{\color{taucolor}\bfseries\fontsize{26pt}{28pt}\selectfont}
\newcommand{\taustart}[1]{\lettrine[lines=2,lraise=0,findent=2pt, nindent=0em]{{\dropcapfont{#1}}}{}}

%lettrine helps us create the dropcap font
%but first we edit the formatting of dropcap font such that:
%       taucolor, bold font, font size (26pt) and line space (28pt)
% -----------------------------------------------------------
% in letterine we specify that
%   drop cap spans 2 lines (lines =2)
%  no vertical raising/lowering (baseline aligned)
%  findent = 2pt   extra horizontal space to the left of the drop cap
% nindent = 0em (indentation of the text after the drop cap)


%----------------------------------------------------------
% TITLE STYLE
%----------------------------------------------------------

% New commands
\newcommand{\journalname}[1]{\def\@journalname{#1}}
\newcommand{\professor}[1]{\def\@professor{#1}}
\newcommand{\titlepos}{\centering}  %\RaggedRight}
\newcommand{\titlefont}{\bfseries\color{taucolor}\fontsize{18}{22}\sffamily\selectfont}
\newcommand{\authorfont}{\normalsize\sffamily}
\newcommand{\professorfont}{\fontsize{7pt}{8pt}\selectfont}

\definecolor{MOFblue}{RGB}{0,51,102} % Dark navy blue

%banner
\newcommand{\titlebanner}[1]{%
  \colorbox{MOFblue}{\parbox{\dimexpr\linewidth-2\fboxsep}{%
      \centering\textbf{\color{white}#1}%
  }}%
}


\renewcommand{\@maketitle}{
    {\ifx\@journalname\undefined\vskip-18pt\else\vskip-25pt\centering\sffamily\bfseries\fontsize{8}{14}\@journalname\par\fi}
    {\titlepos\titlefont{\titlebanner{\@title}\par\vskip8pt}\par\vskip8pt}
    {\authorfont\titlepos\@author\par\vskip8pt}
    {\ifx\@professor\undefined\vskip14pt\else\professorfont\titlepos\@professor\par\vskip22pt\fi}
}
