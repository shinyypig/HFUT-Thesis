% 初始化
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hfut}[2023/1/28 v0.01 HFUT class]

% 设置参数
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

\SetupKeyvalOptions{family=HFUT, prefix=HFUT@, setkeys=\kvsetkeys}
\newcommand{\skv}[1]{\kvsetkeys{HFUT}{#1}}

% 编译参数 final 为最终版，preprint 为预印版
\DeclareStringOption[final]{mode}
\DeclareVoidOption{final}{\skv{mode=final}}
\DeclareVoidOption{preprint}{\skv{mode=preprint}}

\DeclareStringOption[fandol]{font}
\DeclareVoidOption{fandol}{\skv{font=fandol}}
\DeclareVoidOption{adobe}{\skv{font=adobe}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax

\LoadClass[a4paper]{article}

% 数学相关包
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amssymb}

% 颜色
\RequirePackage{color}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{framed}

% 图片
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{float}

% 算法
\RequirePackage{algorithm}
\RequirePackage{algorithmic}

% 目录，摘要
\RequirePackage{tocloft}
\RequirePackage{abstract}

% 其他
\RequirePackage{iftex}
\RequirePackage{silence}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{indentfirst}

% 定义颜色
\definecolor{HEYELV}{HTML}{1a6840}
\definecolor{YEHUI}{HTML}{847c74}
\definecolor{DANQINZI}{HTML}{e0c8d1}
\definecolor{YOULAN}{HTML}{1781b5}
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{lightgrey}{rgb}{0.95,0.95,0.95}
\definecolor{commentcolor}{RGB}{0,100,0}
\definecolor{frenchplum}{RGB}{190,20,83}
\definecolor{shadecolor}{rgb}{0.95,0.95,0.95}

% 字号设置
\newcommand{\chuhao}{\fontsize{42pt}{\baselineskip}\selectfont}     % 字号设置
\newcommand{\xiaochuhao}{\fontsize{36pt}{\baselineskip}\selectfont} % 字号设置
\newcommand{\yichu}{\fontsize{32pt}{\baselineskip}\selectfont}      % 字号设置
\newcommand{\yihao}{\fontsize{28pt}{\baselineskip}\selectfont}      % 字号设置
\newcommand{\erhao}{\fontsize{21pt}{\baselineskip}\selectfont}      % 字号设置
\newcommand{\xiaoerhao}{\fontsize{18pt}{\baselineskip}\selectfont}  % 字号设置
\newcommand{\sanhao}{\fontsize{15.75pt}{\baselineskip}\selectfont}  % 字号设置
\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}      % 字号设置
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}  % 字号设置
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}    % 字号设置
\newcommand{\xiaowuhao}{\fontsize{9pt}{\baselineskip}\selectfont}   % 字号设置
\newcommand{\liuhao}{\fontsize{7.875pt}{\baselineskip}\selectfont}  % 字号设置
\newcommand{\qihao}{\fontsize{5.25pt}{\baselineskip}\selectfont}    % 字号设置

% 设置引用格式
\RequirePackage[
    backend=biber,
    citestyle=numeric-comp,
    bibstyle=gb7714-2015,
    sorting=none,
    gbalign=left,
    url=false,
    doi=false,
    eprint=false,
]{biblatex}
\defbibheading{hfut}[\ebibname]{
    \section*{#1}
    \addcontentsline{toc}{section}{#1}
}
\renewcommand{\supercite}[1]{%
    \textsuperscript{\cite{#1}}%
}
\def\bibfont{\zihao{5}\songti}
% 设置引用文件
\addbibresource{ref.bib}

% 设置链接格式
\RequirePackage{hyperref}
\hypersetup{
    pdfborder={0 0 0},
    colorlinks=false,
    linktoc=all,
}

% 设置页面大小边距等
\RequirePackage{geometry}
\setlength{\parskip}{0.5em}
\setlength{\marginparwidth}{2cm}

% 使用cleveref包用于引用公式图片表格等
\RequirePackage[capitalise]{cleveref}
% 公式引用只显示括号
\crefname{equation}{}{}
\numberwithin{equation}{section}
% 设置bm为boldsymbol
\newcommand{\bm}[1]{\boldsymbol{#1}}

% 批注
\ifdefstring{\HFUT@mode}{preprint}{
    \RequirePackage[mathlines]{lineno}
    \linenumbers
    \RequirePackage[xcolor=dvipdf,markup=default,todonotes={textsize=tiny}]{changes}
    \setcommentmarkup{\todo[color=YEHUI!10, linecolor=black]{[\arabic{authorcommentcount}] #1}}
    \setaddedmarkup{{\color{HEYELV}{#1}}}
    \setdeletedmarkup{{\color{winered}{\sout{#1}}}}
}

\ifdefstring{\HFUT@mode}{final}{
    \RequirePackage[final]{changes}
}

% 设置英文字体
\RequirePackage[no-math]{fontspec}
\setmainfont{Times New Roman}[Scale = 1]
\setsansfont{Times New Roman}[Scale = 0.9]

% 设置中文字体
\ifdefstring{\HFUT@font}{fandol}{
    \RequirePackage[
        UTF8,
        scheme=plain,
        linespread=1.2,
        zihao=-4,
        fontset=fandol
    ]{ctex}
}

\ifdefstring{\HFUT@font}{adobe}{
    \RequirePackage[
        UTF8,
        scheme=plain,
        linespread=1.2,
        zihao=-4,
        fontset=none
    ]{ctex}

    \defaultfontfeatures{Path = fonts/, Mapping=tex-text}

    \setCJKmainfont[
        BoldFont=AdobeHeitiStd-Regular.otf,
        ItalicFont=AdobeKaitiStd-Regular.otf,
        SmallCapsFont=AdobeHeitiStd-Regular.otf
    ]{AdobeSongStd-Light.otf}
    \setCJKsansfont{AdobeHeitiStd-Regular.otf}[AutoFakeBold]
    \setCJKmonofont{AdobeFangsongStd-Regular.otf}[AutoFakeBold]

    \setCJKfamilyfont{zhsong}{AdobeSongStd-Light.otf}[AutoFakeBold]
    \setCJKfamilyfont{zhhei}{AdobeHeitiStd-Regular.otf}[AutoFakeBold]
    \setCJKfamilyfont{zhfs}{AdobeFangsongStd-Regular.otf}[AutoFakeBold]
    \setCJKfamilyfont{zhkai}{AdobeKaitiStd-Regular.otf}[AutoFakeBold]

    \newcommand*{\songti}{\CJKfamily{zhsong}} % 宋体
    \newcommand*{\heiti}{\CJKfamily{zhhei}}   % 黑体
    \newcommand*{\kaishu}{\CJKfamily{zhkai}}  % 楷书
    \newcommand*{\fangsong}{\CJKfamily{zhfs}} % 仿宋
}

% 设置标题格式
\titleformat{\section}{\centering \heiti \sanhao \bfseries}{\thesection}{0.5em}{}
\titleformat{\subsection}{\heiti \xiaosihao}{\thesubsection}{0.4em}{}
\titleformat{\subsubsection}{\songti \xiaosihao \bfseries}{\thesubsubsection}{0.4em}{}
\setlength\parindent{2\ccwd}

% 设置中文环境名称
\theoremstyle{plain}% default
\newtheorem{theorem}{定理}[section] %
\newtheorem{lemma}[theorem]{引理} %
\newtheorem{proposition}[theorem]{命题} %
\newtheorem{property}[theorem]{性质}
\newtheorem*{corollary}{推论} %
\theoremstyle{definition} %
\newtheorem{definition}{定义}[section] %
\newtheorem{conjecture}{猜想}[section] %
\newtheorem{example}{例}[section] %
\theoremstyle{remark} %
\newtheorem*{remark}{\normalfont\bfseries 评论} %
\newtheorem*{note}{\normalfont\bfseries 注} %
\newtheorem{case}{\normalfont\bfseries 案例} %
\renewcommand*{\proofname}{\normalfont\bfseries 证明} %
\renewcommand\contentsname{目 \quad 录}
\renewcommand\refname{参考文献} %
\renewcommand\figurename{图} %
\renewcommand\tablename{表}%
\newcommand\versiontext{版本：}%
\newcommand\updatetext{日期：}%
\newcommand{\ebibname}{参考文献}
\renewcommand\abstractname{摘\hspace{2em}要}
\renewcommand{\ALG@name}{算法}
\renewcommand{\abstracttextfont}{\sffamily\small\noindent\ignorespaces}
% 新定义的引用名称
\newcommand{\keywords}[1]{\vskip2ex\par\noindent\normalfont{\bfseries 关键词: } #1}
\renewcommand{\algorithmicrequire}{\textbf{输入：}}
\renewcommand{\algorithmicensure}{\textbf{输出：}}

\newcommand{\crefrangeconjunction}{~到~}
\newcommand{\crefpairconjunction}{~和~}
\newcommand{\crefmiddleconjunction}{、}
\newcommand{\creflastconjunction}{~和~}
\newcommand{\crefpairgroupconjunction}{~和~}
\newcommand{\crefmiddlegroupconjunction}{、}
\newcommand{\creflastgroupconjunction}{~和~}

\crefname{equation}{式}{式}
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{theorem}{定理}{定理}
\crefname{lemma}{引理}{引理}
\crefname{proposition}{命题}{命题}
\crefname{corollary}{推论}{推论}
\crefname{property}{性质}{性质}
\crefname{definition}{定义}{定义}
\crefname{conjecture}{猜想}{猜想}
\crefname{example}{例}{例}
\crefname{algorithm}{算法}{算法}

\crefname{section}{节}{节}
\crefname{subsection}{小节}{小节}

\crefformat{section}{第#2#1#3节}
\crefformat{subsection}{第#2#1#3小节}

% 图表编号按section编排
\counterwithin{figure}{section}
\counterwithin{table}{section}

% 设置图表标题格式
\DeclareCaptionFormat{smallformat}{\songti \wuhao #1#2#3}
\captionsetup{
    labelsep=quad,
    textformat=simple,
    format=smallformat,
}

% 下划线
\newcommand{\underlineFixlen}[2][3.5cm]{
    \underline{
        \begin{minipage}[b]{#1}
            \centering \setlength{\baselineskip}{10pt} #2
        \end{minipage}
    }
}

% 中文摘要
\renewenvironment{abstract}{
    {
            \begin{center}
                \xiaoerhao \songti \bfseries 摘\hspace{1em}要\vspace{1.1cm}
            \end{center}
        }
    \setlength{\parindent}{2em}
    \setlength{\parskip}{0em}
    \setlength{\baselineskip}{22pt} % （宋体，小四；固定行距22磅，段前、段后均为0行间距。段落首行缩进2字符。）
    \songti
}{
    \setlength{\parindent}{0em}
    \setlength{\parskip}{1em}
    {\par \songti \bfseries{关键词：}}
    \keywordsCn
    \clearpage
}

% 英文摘要
\newenvironment{abstractEn}{
    {
            \begin{center}
                \xiaoerhao \bfseries ABSTRACT\vspace{1.5cm}
            \end{center}
        }
    \setlength{\parindent}{1em}
    \setlength{\parskip}{0em}
    \setlength{\baselineskip}{22pt} % 22磅行距，首行缩进1字符，段前、段后均为0行间距
}{
    \setlength{\parindent}{0em}
    \setlength{\parskip}{1em}
    {\par \bfseries{KEYWORDS:}}
    \keywordsEn
    \clearpage
}

\renewcommand\refname{\heiti \sanhao \bfseries 参考文献}

% 目录名
\renewcommand\contentsname{
    \begin{center}
        \songti \xiaoerhao \bfseries 目\hspace{1em}录 % （宋体，小二号，加粗；居中，单倍行距，段前0.5行、段后1.5行间距）
    \end{center}
    \vspace{1em}
}
% 插图清单
\renewcommand\listfigurename{
    \begin{center}
        \songti \xiaoerhao \bfseries 插图清单 % （宋体，小二号，加粗；居中，单倍行距，段前0.5行、段后1.5行间距）
    \end{center}
    \vspace{1em}
}

% 表格清单
\renewcommand\listtablename{
    \begin{center}
        \songti \xiaoerhao \bfseries 表格清单 % （宋体，小二号，加粗；居中，单倍行距，段前0.5行、段后1.5行间距）
    \end{center}
    \vspace{1em}
}

% 目录引线设置
\renewcommand{\cftdotsep}{1.5} % 线的密度
\renewcommand{\cftsecdotsep}{1.5} % section引线
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecpagefont}{}
\setlength{\cftfignumwidth}{3.5em}
\setlength{\cfttabnumwidth}{3.5em}
% 设置目录标题字体
\renewcommand{\cfttoctitlefont}{\songti\xiaosihao\hfill}
\renewcommand{\cftsecfont}{\songti\xiaosihao\bfseries}
\renewcommand{\cftsecdotsep}{1.5}
% 设置图表编号的宽度
\setlength{\cftfignumwidth}{3.5em}
\setlength{\cfttabnumwidth}{3.5em}
% 设置目录行间距为22磅
\setlength{\cftbeforesecskip}{7pt}
\setlength{\cftbeforesubsecskip}{7pt}
\setlength{\cftbeforesubsubsecskip}{7pt}
\setlength{\cftbeforefigskip}{7pt}
\setlength{\cftbeforetabskip}{7pt}

% 插图清单
\renewcommand{\cftfigpresnum}{\figurename\enspace}

% 表格清单
\renewcommand{\cfttabpresnum}{\tablename\enspace}

% 致谢
\newenvironment{acknowledge}{
    \clearpage
    \vspace*{-2em}
    \phantomsection % 使得hyperref目录能够跳转到正确的位置
    \addcontentsline{toc}{section}{致谢} % 添加到目录中
    \begin{center}
        \songti \xiaoerhao \bfseries 致谢\end{center}\vspace{1.1cm}
    \setlength{\parindent}{2em}
    \setlength{\parskip}{0.5em}
    \setlength{\baselineskip}{22pt} % 22磅行距，首行缩进1字符，段前、段后均为0行间距
    \songti
    \par
}{
    \par

    \hfill 作者：\studentNameCn

    \hfill \finishedYear 年\finishedMonth 月\finishedDay 日

}

% 附录
\renewenvironment{appendix}{
    \clearpage
    \vspace*{-2em}
    \phantomsection % 使得hyperref目录能够跳转到正确的位置
    \addcontentsline{toc}{section}{附录} % 添加到目录中
    \begin{center}
        \songti \xiaoerhao \bfseries 附录\end{center}\vspace{1.1cm}
    \setlength{\parindent}{2em}
    \setlength{\parskip}{0.5em}
    \setlength{\baselineskip}{22pt} % 22磅行距，首行缩进1字符，段前、段后均为0行间距
    \songti
    \par
}{
}

% 月份英文
\newcommand{\monthname}[1]{%
    \ifcase#1
    \or January% 1
    \or February% 2
    \or March% 3
    \or April% 4
    \or May% 5
    \or June% 6
    \or July% 7
    \or August% 8
    \or September% 9
    \or October% 10
    \or November% 11
    \or December% 12
    \fi
}
\newcommand{\finishedMonthEn}{\monthname{\the\month}}

% 设置页眉页脚
\fancypagestyle{contentstyle}{
    \fancyhf{}
    \fancyhead[C]{\footnotesize{合肥工业大学本科毕业设计（论文）}\vspace{0.1cm}}% structure elements
    \fancyfoot[C]{\footnotesize \thepage}% page number
    \renewcommand{\headrulewidth}{0.8pt}% header rule
    \renewcommand{\footrulewidth}{0pt}% footer rule
}
\setlength{\headheight}{14pt}

% 引用latex代码
\RequirePackage{listings}
\lstdefinestyle{estyle}{
    basicstyle=%
    \ttfamily
    \lst@ifdisplaystyle\footnotesize\fi
}
\lstset{basicstyle=\scriptsize\ttfamily,style=estyle}
\lstset{language=[LaTeX]TeX,
    texcsstyle=*\color{winered},
    numbers=none,
    breaklines=true,
    keywordstyle=\color{winered},
    frame=tlbr,framesep=4pt,framerule=0pt,
    commentstyle=\color{commentcolor},
    emph={elegantpaper,fontenc,fontspec,xeCJK,FiraMono,xunicode,newtxmath,figure,fig,image,img,table,itemize,enumerate,newtxtext,newtxtt,ctex,microtype,description,times,newtx,booktabs,tabular,PDFLaTeX,XeLaTeX,type1cm,BibTeX,cite,gbt7714,lang},
    emphstyle={\color{frenchplum}},
    morekeywords={DeclareSymbolFont,SetSymbolFont,toprule,midrule,bottomrule,institute,version,includegraphics,setmainfont,setsansfont,setmonofont ,setCJKmainfont,setCJKsansfont,setCJKmonofont,RequirePackage,figref,tabref,email,maketitle,keywords,zhdate,zhtoday},
    tabsize=2,
    backgroundcolor=\color{lightgrey}
}

% 设置列表格式
\RequirePackage{enumitem}
\setlist[enumerate]{label=\arabic*., itemsep=0pt, parsep=0pt, leftmargin=2em, rightmargin=0pt,topsep=0pt, partopsep=0pt}
\setlist[itemize]{label=\textbullet, itemsep=0pt, parsep=0pt, leftmargin=2em, rightmargin=0pt, topsep=0pt, partopsep=0pt}