\ProvidesClass{cv-friggeri-x}[2016/01/01 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{lightheader}{\def\@cv@lightheader{}}

\DeclareOption{nocolors}{\def\@cv@nocolors{}}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}

% Add support for A4 paper
\newif\ifafourpaper

\afourpaperfalse

\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}%
    \afourpapertrue%
   }

\ProcessOptions\relax
\LoadClass{article}


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
\definecolor{fblue}{HTML}{3D539E}
\definecolor{tblue}{HTML}{55ACEE}
\definecolor{lblue}{HTML}{0077B5}
\definecolor{vkblue}{HTML}{A6B8D4}
\definecolor{navy}{HTML}{8487DB}

\colorlet{fillheader}{gray}
\colorlet{header}{white}

%\ifdefined\@cv@lightheader
%  \colorlet{fillheader}{white}
%  \colorlet{header}{gray}
%\else 
%  \colorlet{fillheader}{gray}
%  \colorlet{header}{white}
%\fi

\ifdefined\@cv@nocolors
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fblue}{gray}
  \colorlet{tblue}{gray}
  \colorlet{lblue}{gray}
  \colorlet{vkblue}{gray}
\fi

\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

\newfontfamily\bodyfont[]{Roboto}
\newfontfamily\headerthinfont[]{Roboto Thin}
\newfontfamily\headerboldfont[]{Roboto Light}
%\newfontfamily\headerthinfont[]{Roboto Thin}
%\newfontfamily\headerboldfont[]{Roboto}
% \newfontfamily\headerboldfont[]{Roboto Condensed Bold}

\newfontfamily\headingfont[]{Montserrat Medium}
\newfontfamily\thinfont[]{Montserrat Light}
%\newfontfamily\headingfont[]{Tahoma}
%\newfontfamily\segoesemifont[]{Segoe UI Light}
%\newfontfamily\calibrifont[]{Calibri}
\newfontfamily\boldfont[]{Montserrat}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Roboto Light}

%\setmathfont{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=5cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\hspace*{2cm}}{\headerthinfont #1}{\hspace*{0.35cm}}{\headerboldfont  #2 }
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      {\hspace*{2cm}}\thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2cm}
  \vspace{5\parskip}
}

\newcommand{\userpic}[1]{
  \let\oldsection\section
\begin{tikzpicture}
\begin{scope}
\clip [rounded corners=2.2cm] (0,0) rectangle coordinate (centerpoint) (4.4,4.4cm); 
\node [inner sep=0pt] at (centerpoint) {\includegraphics[width=4.4cm]{#1}};
\end{scope}
\end{tikzpicture}
}

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

%\newcounter{colorCounter}
%\def\@sectioncolor#1#2#3{%
%  {%
%    \color{%
%      \ifcase\value{colorCounter}%
%        blue\or%
%        red\or%
%        orange\or%
%        green\or%
%        purple\or%
%        brown\else%
%        headercolor\fi%
%    } #1#2#3%
%  }%
%  \stepcounter{colorCounter}%
%}
%\newcounter{colorCounter}
%\def\@sectioncolor#1{%
%  {%
%    \color{%
%      \ifcase\value{colorCounter}%
%%        gray\or%
%%        gray\or%
%%        gray\or%
%%        gray\or%
%%        gray\or%
%%        gray\else%
%%        gray\fi%
%        blue\or%
%        red\or%
%        orange\or%
%        green\or%
%        purple\or%
%        brown\else%
%        headercolor\fi%
%    } #1%
%  }%
%  \stepcounter{colorCounter}%
%}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \Large\headingfont\color{headercolor}%
    \color{navy} #1%
      \vspace{\parsep}%
  }
  \par\vspace{.15\parskip}%
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #1}
  \par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[2]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #2}
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}

% Set a4paper and US letter size as explained here:
% http://tex.stackexchange.com/questions/248399/trasform-friggeri-cv-to-a4

\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\ifafourpaper
	  \newcommand{\entry}[4]{%
	  \parbox[t]{2cm}{#1}&\parbox[t]{11.1cm}{%
	  \textbf{#2}%
	  \hfill%
	  {  \normalsize\addfontfeature{Color=lightgray} #3}\\%
	  #4\vspace{\parsep}%
	  }\\}
\else
	  \newcommand{\entry}[4]{%
	    \parbox[t]{2cm}{#1}&\parbox[t]{11.6cm}{%
	    \textbf{#2}%
	    \hfill%
	    {  \normalsize\addfontfeature{Color=lightgray} #3}\\%
	    #4\vspace{\parsep}%
	    }\\}
\fi

\ifafourpaper
	\newcommand{\educationentry}[5]{%
	    \parbox[t]{2cm}{#1}&\parbox[t]{11.1cm}{%
	    \textbf{#2}%
	    \hfill%
	    {  \normalsize\addfontfeature{Color=lightgray} #3}\\%
	    #4\vspace{.3\parsep}\\%
	    #5\vspace{\parsep}%
	    }\\
	}
\else
	\newcommand{\educationentry}[5]{%
	    \parbox[t]{2cm}{#1}&\parbox[t]{11.6cm}{%
	    \textbf{#2}%
	    \hfill%
	    {  \normalsize\addfontfeature{Color=lightgray} #3}\\%
	    #4\vspace{.3\parsep}\\%
	    #5\vspace{\parsep}%
	    }\\
	}
\fi

\newcommand{\trainingentry}[3]{%
%{\hfill#1}
    \parbox[t]{2cm}{#1}&\parbox[t]{11.1cm}{%
    \textbf{#2}%
    \hfill%
    {  \normalsize\addfontfeature{Color=lightgray} #3}\\%
    }\\
}

\newcommand{\paragraphsection}[2]{%
  {\textbf{#1}}{\hspace*{0.2cm}}{\normalsize #2}
  \par\vspace{.05\parskip}%
}%

\usepackage{scrextend}
\newcommand{\projectentry}[2]{%
%{\large\boldfont\color{headercolor}{#1}}
{\textbf{#1}}
  \begin{addmargin}[0.2em]{0em}
  \color{headercolor}{#2}%
  \par\vspace{.45\parskip}%
  \end{addmargin}
}%


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\large\headingfont\color{headercolor} ##1}
      \vspace{\parsep}%
  }
  \begin{textblock}{4.5}(1.0, 2.5)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

\newenvironment{asidebis}{%
  %\let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}
    {
    \par\vspace{\baselineskip}{\large\headingfont\color{headercolor} ##1}
      \vspace{\parsep}%
    }
  }
  \begin{textblock}{4.5}(1.0, 1.0)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[backend=biber, style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{\href{\thefield{url}}{#1}}
\DeclareFieldFormat[inproceedings]{title}{\href{\thefield{url}}{#1}}
\DeclareFieldFormat[book]{title}{\href{\thefield{url}}{#1}}
\DeclareFieldFormat[misc]{title}{\href{\thefield{url}}{#1}}
\DeclareFieldFormat[report]{title}{\href{\thefield{url}}{#1}}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{book}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}


\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \nameparts{#1}\ifblank{\namepartgiven}{}{\namepartgiven\space}\namepartfamily%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

\defbibheading{bibheading}[\bibname]{%
   \subsubsection*{#1}
   \markboth{#1}{#1}
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=bibheading]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
\hypersetup{
	hidelinks,
	%colorlinks,
	linkcolor=red,
	citecolor=red,
	filecolor=red,
	urlcolor = blue
}

% Newcommands for glyph printing
\RequirePackage{graphicx}

% Add a Google-style pin
\newcommand*{\pin}{%
  \textcolor{gray}{\includegraphics[height=1em]{resources/pin}}%
}

% Add linkedin logo
\newcommand*{\llogo}{%
  \textcolor{lblue}{\hspace*{0.18cm}\includegraphics[height=1em]{resources/linkedin_logo}}%
}

% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother

