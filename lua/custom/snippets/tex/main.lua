--TODO: 
--tables

return {
  s("pic", fmta([[
    \begin{figure}[h]
    \includegraphics[width=\textwidth]{<>}
    \end{figure}
  ]], {i(1)})),

  s("fig", fmta([[
    \begin{figure}[h]
      \includegraphics[width=\linewidth]{<>}
      \caption{<>}
      \label{fig:<>}
    \end{figure}
  ]], {i(1), i(2), i(1, rep(1))})),

  s("ref", fmta([[\ref{<>}]], {i(1)})),
  s("cit", fmta([[\cite{<>}]], {i(1)})),
  s("ap", t([[\appendix]])),
  s("bib", t([[\bibliography{references.bib}]])),

}, {
    s("# ", fmta([[\section{<>}]], {i(1)}), {condition=conds.line_begin}),
    s("## ", fmta([[\subsection{<>}]], {i(1)}), {condition=conds.line_begin}),
    s("### ", fmta([[\subsection{<>}]], {i(1)}), {condition=conds.line_begin}),
    s("#### ", fmta([[\subsection{<>}]], {i(1)}), {condition=conds.line_begin}),
}
