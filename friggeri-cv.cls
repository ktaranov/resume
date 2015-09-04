\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}
\errorcontextlines 10000


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}

\newfontfamily\bodyfont[ExternalLocation=Fonts/HelveticaNeue/]{HelveticaNeueLight.ttf}
\newfontfamily\thinfont[ExternalLocation=Fonts/HelveticaNeue/]{HelveticaNeueUltraLight.ttf}
\newfontfamily\headingfont[ExternalLocation=Fonts/HelveticaNeue/]{HelveticaNeueCondensedBold.ttf}
\newfontfamily\italicfont[ExternalLocation=Fonts/HelveticaNeue/]{HelveticaNeueUltraLightItalic.ttf}
\newfontfamily\boldfont[ExternalLocation=Fonts/HelveticaNeue/]{HelveticaNeueMedium.ttf}
\newfontfamily\bolditalic[ExternalLocation=Fonts/HelveticaNeue/]{HelveticaNeueBoldItalic.ttf}
\newfontfamily\mediumitalic[ExternalLocation=Fonts/HelveticaNeue/]{HelveticaNeueLightItalic.ttf}
\newfontfamily\lightbold[ExternalLocation=Fonts/HelveticaNeue/]{HelveticaNeueMedium.ttf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[ExternalLocation=Fonts/HelveticaNeue/, Mapping=tex-text, Color=textcolor]{HelveticaNeueLight.ttf}

\setmathfont[ExternalLocation=Fonts/]{ZapfDingbats.ttf}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{11pt}{20pt}\selectfont%
  \bodyfont%
  \color{white}%
}

\newcommand{\header}[4]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{55pt}\color{header}%
      {\bodyfont #1}{\thinfont #2}{\headingfont #3}
    };
    \node [anchor=north] at (name.south) {%
      \rolefont\color{header}%
      \thinfont #4%
      \\
    };
    
  \end{tikzpicture}
  \vspace{1cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\else%
        headercolor\fi%
    } #1%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  %\par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{.35\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.35\parskip}%
  \large\headingfont\color{headercolor} #1%
  \hfill{\footnotesize\addfontfeature{Color=lightgray} #2}%
  %\par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}
  {\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  \fontsize{9pt}{11pt}\lightbold #1 
  &\parbox[t]{11.5cm}{%
    \fontsize{9pt}{11pt}\bolditalic{#2} \fontsize{9pt}{11pt}\bodyfont{#3}%
    \hspace*{\fill}\\%
    \fontsize{9pt}{11pt}\bodyfont{#4}%
  }\hspace*{\fill}\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

%\RequirePackage[absolute,overlay]{textpos}
%\setlength{\TPHorizModule}{1cm}
%\setlength{\TPVertModule}{1cm}
%\newenvironment{aside}{%
%  \let\oldsection\section
%  \renewcommand{\section}[1]{
%    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
%  }
%  \begin{textblock}{3.6}(1, 4.33)
%  \begin{flushright}
%  \obeycr
%}{%
%  \restorecr
%  \end{flushright}
%  \end{textblock}
%  \let\section\oldsection
%}


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=2.5cm,top=2cm,right=2.5cm,bottom=1.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}