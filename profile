<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Md. Rahatul Karim — Data &amp; AI</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&family=IBM+Plex+Sans:wght@400;500;600&family=IBM+Plex+Mono:wght@400;500&display=swap" rel="stylesheet">
<style>
  :root{
    --bg: #F6F4EC;
    --ink: #16211F;
    --teal: #1E6F63;
    --teal-deep: #14504A;
    --amber: #D98E3B;
    --rule: #CFC6AF;
    --muted: #666f68;
    --card: #FFFFFF;
    --maxw: 760px;
  }
  *{box-sizing:border-box;}
  html{scroll-behavior:smooth;}
  body{
    margin:0;
    background:var(--bg);
    color:var(--ink);
    font-family:'IBM Plex Sans', sans-serif;
    font-size:17px;
    line-height:1.6;
    -webkit-font-smoothing:antialiased;
  }
  ::selection{ background:var(--amber); color:var(--ink); }
  a{ color:var(--teal-deep); text-decoration-thickness: 1px; text-underline-offset: 3px; }
  a:hover{ color:var(--amber); }
  .wrap{ max-width: var(--maxw); margin: 0 auto; padding: 0 28px; }

  /* ---------- scroll progress ---------- */
  #progress{
    position: fixed; top:0; left:0; height: 3px; width:0%;
    background: linear-gradient(90deg, var(--teal), var(--amber));
    z-index: 1000; transition: width 0.08s linear;
  }

  /* ---------- nav ---------- */
  nav#topnav{
    position: sticky; top:0; z-index: 900;
    background: rgba(246,244,236,0.86);
    backdrop-filter: blur(8px);
    border-bottom: 1px solid var(--rule);
  }
  .nav-inner{
    max-width: var(--maxw); margin:0 auto; padding: 14px 28px;
    display:flex; align-items:center; justify-content:space-between;
    gap: 14px;
  }
  .nav-mark{
    font-family:'Space Grotesk', sans-serif; font-weight:700; font-size: 15px;
    color: var(--ink); text-decoration:none; flex-shrink:0;
  }
  .nav-mark span{ color: var(--teal-deep); }
  .nav-links{
    display:flex; gap: 20px; list-style:none; margin:0; padding:0;
    overflow-x:auto; scrollbar-width:none;
  }
  .nav-links::-webkit-scrollbar{ display:none; }
  .nav-links a{
    font-family:'IBM Plex Mono', monospace; font-size: 12.5px;
    color: var(--muted); text-decoration:none; white-space:nowrap;
    padding: 4px 2px; border-bottom: 2px solid transparent;
    transition: color 0.15s ease, border-color 0.15s ease;
  }
  .nav-links a:hover{ color: var(--ink); }
  .nav-links a.active{ color: var(--teal-deep); border-color: var(--amber); }

  /* ---------- ledger grid rows ---------- */
  .cell-row{
    display:grid; grid-template-columns: 120px 1fr;
    border-top:1px solid var(--rule); padding: 14px 0; gap: 18px;
    transition: background 0.2s ease, padding-left 0.2s ease;
    border-radius: 4px;
  }
  .cell-row:last-child{ border-bottom:1px solid var(--rule); }
  .cell-row:hover{ background: rgba(30,111,99,0.05); padding-left: 8px; }
  .cell-label{
    font-family:'IBM Plex Mono', monospace; font-size: 13px;
    color: var(--muted); padding-top: 2px;
  }
  .cell-value{ font-size: 16px; }

  /* ---------- hero ---------- */
  header.hero{ padding: 64px 0 40px; position: relative; overflow:hidden; }
  .grid-mark{ position:absolute; top: 66px; right: 28px; width: 88px; height: 88px; }
  .grid-mark rect{ transition: transform 0.4s ease; transform-origin: center; }
  header.hero:hover .grid-mark rect{ transform: scale(1.15); }
  .kicker{ font-family:'IBM Plex Mono', monospace; font-size: 13px; color: var(--teal-deep); margin: 0 0 18px; }
  h1.name{
    font-family:'Space Grotesk', sans-serif; font-weight: 700;
    font-size: clamp(2.4rem, 6vw, 3.6rem); line-height: 1.05;
    margin: 0 0 14px; letter-spacing: -0.01em; max-width: 11ch;
  }
  .role-line{ font-family:'Space Grotesk', sans-serif; font-weight: 500; font-size: 1.25rem; color: var(--teal-deep); margin: 0 0 22px; }
  .objective{ max-width: 58ch; font-size: 1.02rem; margin: 0 0 30px; }
  .hero-meta{ display:flex; flex-wrap:wrap; gap: 6px 22px; font-family:'IBM Plex Mono', monospace; font-size: 13.5px; color: var(--muted); }
  .hero-meta a{ color: var(--muted); }
  .hero-meta a:hover{ color: var(--amber); }
  .hero-cta{
    display:inline-flex; align-items:center; gap:8px; margin-top: 28px;
    font-family:'IBM Plex Mono', monospace; font-size: 13px;
    background: var(--teal-deep); color: #F6F4EC; padding: 10px 16px;
    border-radius: 6px; text-decoration:none; border:none; cursor:pointer;
    transition: transform 0.15s ease, background 0.15s ease;
  }
  .hero-cta:hover{ background: var(--teal); color:#fff; transform: translateY(-1px); }

  /* ---------- reveal on scroll ---------- */
  .reveal{ opacity:0; transform: translateY(18px); transition: opacity 0.55s ease, transform 0.55s ease; }
  .reveal.in{ opacity:1; transform:none; }

  /* ---------- sections ---------- */
  section{ padding: 46px 0; }
  section + section{ border-top: 1px solid var(--rule); }
  h2.section-title{ font-family:'Space Grotesk', sans-serif; font-weight: 600; font-size: 1.5rem; margin: 0 0 26px; }
  .lede{ color: var(--muted); max-width: 56ch; margin: -14px 0 26px; font-size: 0.98rem; }

  .entry{ padding: 18px 0; border-top: 1px solid var(--rule); transition: padding-left 0.2s ease; }
  .entry:first-child{ border-top:none; }
  .entry:hover{ padding-left: 8px; }
  .entry-head{ display:flex; justify-content:space-between; align-items:baseline; gap: 16px; flex-wrap: wrap; }
  .entry-title{ font-weight: 600; font-size: 1.05rem; }
  .entry-when{ font-family:'IBM Plex Mono', monospace; font-size: 12.5px; color: var(--muted); white-space: nowrap; }
  .entry-sub{ color: var(--teal-deep); font-size: 0.95rem; margin-top: 2px; }
  .entry ul{ margin: 10px 0 0; padding-left: 20px; }
  .entry li{ margin: 4px 0; }
  .entry li::marker{ color: var(--amber); }

  .project{ padding: 20px; border: 1px solid var(--rule); border-radius: 8px; background: var(--card);
    transition: transform 0.2s ease, box-shadow 0.2s ease; }
  .project:hover{ transform: translateY(-3px); box-shadow: 0 10px 24px rgba(22,33,31,0.08); }
  .project + .project{ margin-top: 16px; }
  .project-title{ font-family:'Space Grotesk', sans-serif; font-weight: 600; font-size: 1.1rem; margin: 0 0 6px; }
  .project-desc{ margin: 0 0 8px; max-width: 58ch; }
  .project-link{ font-family:'IBM Plex Mono', monospace; font-size: 13px; }

  .interest-line{ font-size: 1.02rem; }
  .interest-line .amp{ color: var(--amber); }

  footer{ padding: 46px 0 90px; }
  .contact-title{ font-family:'Space Grotesk', sans-serif; font-weight: 600; font-size: 1.7rem; margin: 0 0 16px; }
  .contact-list{ display:flex; flex-direction:column; gap: 10px; font-size: 1.05rem; }
  .contact-list a{ font-weight: 500; }
  .foot-note{ margin-top: 40px; font-family:'IBM Plex Mono', monospace; font-size: 12px; color: var(--muted); }

  @media (max-width: 560px){
    .cell-row{ grid-template-columns: 1fr; gap: 4px; }
    .cell-label{ padding-top:0; }
    .grid-mark{ display:none; }
    header.hero{ padding-top: 40px; }
  }

  /* ================= CHATBOT ================= */
  #chat-toggle{
    position: fixed; bottom: 24px; right: 24px; z-index: 950;
    width: 58px; height: 58px; border-radius: 50%;
    background: var(--teal-deep); color: #F6F4EC; border: none; cursor: pointer;
    display:flex; align-items:center; justify-content:center;
    box-shadow: 0 8px 22px rgba(20,80,74,0.35);
    transition: transform 0.2s ease, background 0.2s ease;
  }
  #chat-toggle:hover{ background: var(--teal); transform: translateY(-2px) scale(1.03); }
  #chat-toggle svg{ width: 26px; height:26px; }
  #chat-toggle .dot{
    position:absolute; top:6px; right:6px; width:10px; height:10px; border-radius:50%;
    background: var(--amber); border: 2px solid var(--bg);
  }

  #chat-panel{
    position: fixed; bottom: 96px; right: 24px; z-index: 950;
    width: min(340px, calc(100vw - 32px));
    height: min(480px, calc(100vh - 140px));
    background: var(--card); border: 1px solid var(--rule);
    border-radius: 14px; box-shadow: 0 20px 50px rgba(22,33,31,0.22);
    display:flex; flex-direction:column; overflow:hidden;
    opacity:0; transform: translateY(14px) scale(0.98); pointer-events:none;
    transition: opacity 0.2s ease, transform 0.2s ease;
  }
  #chat-panel.open{ opacity:1; transform:none; pointer-events:auto; }

  .chat-head{
    background: var(--teal-deep); color: #F6F4EC; padding: 14px 16px;
    display:flex; align-items:center; justify-content:space-between; flex-shrink:0;
  }
  .chat-head-title{ font-family:'Space Grotesk', sans-serif; font-weight:600; font-size:14.5px; }
  .chat-head-sub{ font-family:'IBM Plex Mono', monospace; font-size: 10.5px; color: #BFE0D9; margin-top:2px; }
  .chat-close{ background:none; border:none; color:#F6F4EC; font-size:20px; cursor:pointer; line-height:1; padding:2px 6px; }

  .chat-body{ flex:1; overflow-y:auto; padding: 14px; display:flex; flex-direction:column; gap:10px; background: var(--bg); }
  .msg{ max-width: 84%; padding: 9px 12px; border-radius: 12px; font-size: 14px; line-height:1.5; }
  .msg.bot{ align-self:flex-start; background:#fff; border:1px solid var(--rule); border-bottom-left-radius:3px; }
  .msg.user{ align-self:flex-end; background: var(--teal-deep); color:#F6F4EC; border-bottom-right-radius:3px; }
  .msg a{ color: inherit; text-decoration-thickness: 1px; }
  .msg.bot a{ color: var(--teal-deep); }

  .typing{ align-self:flex-start; display:flex; gap:4px; padding: 10px 12px; background:#fff; border:1px solid var(--rule); border-radius:12px; border-bottom-left-radius:3px; }
  .typing span{ width:6px; height:6px; border-radius:50%; background: var(--muted); opacity:0.5; animation: blink 1.2s infinite; }
  .typing span:nth-child(2){ animation-delay:0.2s; }
  .typing span:nth-child(3){ animation-delay:0.4s; }
  @keyframes blink{ 0%,80%,100%{ opacity:0.3; } 40%{ opacity:1; } }

  .chips{ display:flex; flex-wrap:wrap; gap:6px; padding: 0 14px 10px; flex-shrink:0; background: var(--bg); }
  .chip{
    font-family:'IBM Plex Mono', monospace; font-size: 11.5px;
    background: #fff; border: 1px solid var(--rule); color: var(--teal-deep);
    padding: 6px 10px; border-radius: 20px; cursor:pointer;
    transition: background 0.15s ease, border-color 0.15s ease;
  }
  .chip:hover{ background: rgba(30,111,99,0.08); border-color: var(--teal); }

  .chat-input-row{ display:flex; gap:8px; padding: 12px; border-top: 1px solid var(--rule); background:#fff; flex-shrink:0; }
  .chat-input-row input{
    flex:1; border: 1px solid var(--rule); border-radius: 20px; padding: 9px 14px;
    font-family:'IBM Plex Sans', sans-serif; font-size: 14px; outline:none; background: var(--bg); color: var(--ink);
  }
  .chat-input-row input:focus{ border-color: var(--teal); }
  .chat-send{
    width: 38px; height:38px; border-radius:50%; border:none; background: var(--teal-deep); color:#fff;
    cursor:pointer; display:flex; align-items:center; justify-content:center; flex-shrink:0;
    transition: background 0.15s ease;
  }
  .chat-send:hover{ background: var(--teal); }
  .chat-send svg{ width:16px; height:16px; }

  @media (max-width: 420px){
    #chat-panel{ right: 12px; bottom: 88px; }
    #chat-toggle{ right: 16px; bottom: 16px; }
  }

  @media (prefers-reduced-motion: reduce){
    html{ scroll-behavior:auto; }
    .reveal{ transition:none; opacity:1; transform:none; }
  }

  :focus-visible{ outline: 2px solid var(--teal-deep); outline-offset: 3px; }
</style>
</head>
<body>

<div id="progress"></div>

<nav id="topnav">
  <div class="nav-inner">
    <a href="#top" class="nav-mark">RK<span>.</span></a>
    <ul class="nav-links">
      <li><a href="#skills" data-nav>Skills</a></li>
      <li><a href="#experience" data-nav>Experience</a></li>
      <li><a href="#certification" data-nav>Certification</a></li>
      <li><a href="#education" data-nav>Education</a></li>
      <li><a href="#projects" data-nav>Projects</a></li>
      <li><a href="#contact" data-nav>Contact</a></li>
    </ul>
  </div>
</nav>

<header class="hero" id="top">
  <div class="wrap">
    <svg class="grid-mark" viewBox="0 0 88 88" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
      <g fill="none" stroke="#1E6F63" stroke-width="1.4" opacity="0.55">
        <line x1="0" y1="22" x2="88" y2="22"/>
        <line x1="0" y1="44" x2="88" y2="44"/>
        <line x1="0" y1="66" x2="88" y2="66"/>
        <line x1="22" y1="0" x2="22" y2="88"/>
        <line x1="44" y1="0" x2="44" y2="88"/>
        <line x1="66" y1="0" x2="66" y2="88"/>
      </g>
      <rect x="44" y="22" width="22" height="22" fill="#D98E3B" opacity="0.85"/>
    </svg>

    <p class="kicker">Dhaka, Bangladesh</p>
    <h1 class="name">Md. Rahatul Karim</h1>
    <p class="role-line">MIS student &amp; data analyst in training</p>
    <p class="objective">I turn raw datasets into decisions. Currently studying Management Information Systems at the University of Dhaka, and building a practice around Excel, Power BI, Python and AI-assisted analysis&nbsp;— one real dataset at a time.</p>
    <div class="hero-meta">
      <span>+880&nbsp;1842-760564</span>
      <a href="mailto:rahatul.du@gmail.com">rahatul.du@gmail.com</a>
      <a href="https://github.com/Rahatulkarim" target="_blank" rel="noopener">github.com/Rahatulkarim</a>
    </div>
    <button class="hero-cta" id="hero-chat-btn" type="button">Ask my assistant anything &rarr;</button>
  </div>
</header>

<section id="skills" class="reveal">
  <div class="wrap">
    <h2 class="section-title">What I work with</h2>
    <div class="cell-row"><div class="cell-label">technical</div><div class="cell-value">Excel, Power BI, Python, Microsoft Word, PowerPoint, LaTeX, Canva</div></div>
    <div class="cell-row"><div class="cell-label">data</div><div class="cell-value">Data cleaning, data visualization, report automation</div></div>
    <div class="cell-row"><div class="cell-label">ai tools</div><div class="cell-value">Prompt engineering, AI-assisted research, AI-driven content &amp; data analysis, AI app building</div></div>
    <div class="cell-row"><div class="cell-label">soft skills</div><div class="cell-value">Leadership, analytical thinking, problem solving</div></div>
    <div class="cell-row"><div class="cell-label">languages</div><div class="cell-value">English, Bangla</div></div>
  </div>
</section>

<section id="experience" class="reveal">
  <div class="wrap">
    <h2 class="section-title">Experience</h2>
    <div class="entry">
      <div class="entry-head">
        <div>
          <div class="entry-title">Data Analysis Practice</div>
          <div class="entry-sub">Freelance / academic projects</div>
        </div>
      </div>
      <ul>
        <li>Analyzed real-world datasets from Kaggle using Excel and Python</li>
        <li>Applied data cleaning, visualization and interpretation techniques to surface trends and insights</li>
        <li>Built visual reports in Power BI and Google Sheets</li>
      </ul>
    </div>
  </div>
</section>

<section id="certification" class="reveal">
  <div class="wrap">
    <h2 class="section-title">Certification</h2>
    <div class="entry">
      <div class="entry-head">
        <div>
          <div class="entry-title">Google AI Professional Certificate</div>
          <div class="entry-sub">Google / Coursera</div>
        </div>
        <div class="entry-when">April 2026</div>
      </div>
      <p style="margin:10px 0 6px;">Seven courses covering AI fundamentals through app building, capped by a portfolio of 20+ AI-powered artifacts and a custom AI solution built with vibe coding.</p>
      <ul>
        <li>AI Fundamentals, Brainstorming &amp; Planning, Research &amp; Insights</li>
        <li>Writing &amp; Communicating, Content Creation, Data Analysis, App Building</li>
        <li>Effective prompting, output evaluation and responsible AI tool use</li>
      </ul>
      <p class="project-link" style="margin-top:12px;">Credential ID: ZD7KNEMYR206</p>
    </div>
  </div>
</section>

<section id="education" class="reveal">
  <div class="wrap">
    <h2 class="section-title">Education</h2>
    <div class="entry">
      <div class="entry-head">
        <div><div class="entry-title">University of Dhaka</div><div class="entry-sub">B.S. in Management Information Systems</div></div>
        <div class="entry-when">Ongoing</div>
      </div>
    </div>
    <div class="entry">
      <div class="entry-head">
        <div><div class="entry-title">Chattogram Bandar College</div><div class="entry-sub">Higher Secondary Certificate</div></div>
        <div class="entry-when">2022 &middot; GPA 5.00/5.00</div>
      </div>
    </div>
    <div class="entry">
      <div class="entry-head">
        <div><div class="entry-title">Khaja Ajmeri High School</div><div class="entry-sub">Secondary School Certificate</div></div>
        <div class="entry-when">2020 &middot; GPA 4.33/5.00</div>
      </div>
    </div>
  </div>
</section>

<section id="projects" class="reveal">
  <div class="wrap">
    <h2 class="section-title">Projects</h2>
    <p class="lede">A running portfolio of data analysis, visualization and programming practice.</p>
    <div class="project">
      <div class="project-title">GitHub portfolio</div>
      <p class="project-desc">Ongoing collection of data analysis, visualization and programming projects, published as I build.</p>
      <a class="project-link" href="https://github.com/Rahatulkarim" target="_blank" rel="noopener">github.com/Rahatulkarim</a>
    </div>
  </div>
</section>

<section id="interests" class="reveal">
  <div class="wrap">
    <h2 class="section-title">Off the spreadsheet</h2>
    <p class="interest-line">Football <span class="amp">&amp;</span> cricket, traveling <span class="amp">&amp;</span> reading informative books.</p>
  </div>
</section>

<footer id="contact" class="reveal">
  <div class="wrap">
    <h2 class="contact-title">Let's work on something</h2>
    <div class="contact-list">
      <a href="mailto:rahatul.du@gmail.com">rahatul.du@gmail.com</a>
      <span>+880 1842-760564</span>
      <a href="https://github.com/Rahatulkarim" target="_blank" rel="noopener">GitHub — Rahatulkarim</a>
    </div>
    <p class="foot-note">Dhaka, Bangladesh</p>
  </div>
</footer>

<!-- ================= CHATBOT ================= -->
<button id="chat-toggle" type="button" aria-label="Open chat assistant">
  <span class="dot"></span>
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
</button>

<div id="chat-panel" role="dialog" aria-label="Chat with Rahatul's assistant">
  <div class="chat-head">
    <div>
      <div class="chat-head-title">Ask about Rahatul</div>
      <div class="chat-head-sub">answers pulled from his resume</div>
    </div>
    <button class="chat-close" id="chat-close" aria-label="Close chat">&times;</button>
  </div>
  <div class="chat-body" id="chat-body"></div>
  <div class="chips" id="chat-chips"></div>
  <div class="chat-input-row">
    <input type="text" id="chat-input" placeholder="Ask a question…" autocomplete="off">
    <button class="chat-send" id="chat-send" aria-label="Send">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="22" y1="2" x2="11" y2="13"></line><polygon points="22 2 15 22 11 13 2 9 22 2"></polygon></svg>
    </button>
  </div>
</div>

<script>
(function(){
  /* ---------- scroll progress ---------- */
  var progress = document.getElementById('progress');
  function updateProgress(){
    var h = document.documentElement;
    var scrolled = h.scrollTop;
    var max = h.scrollHeight - h.clientHeight;
    progress.style.width = (max > 0 ? (scrolled/max*100) : 0) + '%';
  }
  document.addEventListener('scroll', updateProgress, {passive:true});
  updateProgress();

  /* ---------- reveal on scroll ---------- */
  var revealEls = document.querySelectorAll('.reveal');
  if('IntersectionObserver' in window){
    var io = new IntersectionObserver(function(entries){
      entries.forEach(function(e){
        if(e.isIntersecting){ e.target.classList.add('in'); io.unobserve(e.target); }
      });
    }, {threshold: 0.12});
    revealEls.forEach(function(el){ io.observe(el); });
  } else {
    revealEls.forEach(function(el){ el.classList.add('in'); });
  }

  /* ---------- nav active-section highlight ---------- */
  var navLinks = document.querySelectorAll('[data-nav]');
  var sections = Array.prototype.map.call(navLinks, function(a){
    return document.querySelector(a.getAttribute('href'));
  }).filter(Boolean);

  function updateNav(){
    var pos = window.scrollY + 120;
    var current = sections[0];
    sections.forEach(function(sec){ if(sec.offsetTop <= pos) current = sec; });
    navLinks.forEach(function(a){
      a.classList.toggle('active', a.getAttribute('href') === '#' + current.id);
    });
  }
  document.addEventListener('scroll', updateNav, {passive:true});
  updateNav();

  /* ================= CHATBOT ================= */
  var KB = {
    answers: [
      { keys: ["hi","hello","hey","assalam","salam"],
        reply: "Hey! I'm a small assistant trained on Rahatul's resume. Ask me about his skills, education, certification, projects, or how to reach him." },

      { keys: ["skill","tool","tech","technical","stack","excel","power bi","python","proficien"],
        reply: "Rahatul works with Excel, Power BI, Python, Microsoft Word, PowerPoint, LaTeX and Canva. On the data side: data cleaning, visualization and report automation. On the AI side: prompt engineering, AI-assisted research, and AI-driven content and data analysis." },

      { keys: ["education","study","university","degree","college","school","dhaka university","mis","gpa"],
        reply: "He's currently pursuing a Bachelor's in Management Information Systems (MIS) at the University of Dhaka. Before that: HSC from Chattogram Bandar College (2022, GPA 5.00/5.00) and SSC from Khaja Ajmeri High School (2020, GPA 4.33/5.00)." },

      { keys: ["cert","certificate","certification","google ai","credential","coursera"],
        reply: "He holds the Google AI Professional Certificate (Google/Coursera, April 2026) — seven courses spanning AI fundamentals to app building, plus a portfolio of 20+ AI-powered artifacts. Credential ID: ZD7KNEMYR206." },

      { keys: ["experience","work","job","internship","freelance","career"],
        reply: "His hands-on experience is in Data Analysis Practice (freelance/academic): analyzing real Kaggle datasets in Excel and Python, and building visual reports in Power BI and Google Sheets." },

      { keys: ["project","portfolio","github","repo","code"],
        reply: "His project work lives on GitHub — data analysis, visualization and programming practice, published as he builds. You can browse it at github.com/Rahatulkarim." },

      { keys: ["contact","email","phone","reach","hire","number","call"],
        reply: "Best way to reach him: rahatul.du@gmail.com or +880 1842-760564. He's based in Dhaka, Bangladesh." },

      { keys: ["interest","hobby","hobbies","football","cricket","travel","read","book"],
        reply: "Outside of spreadsheets: football and cricket, traveling, and reading informative books." },

      { keys: ["ai","artificial intelligence","prompt","llm"],
        reply: "AI is a core part of his toolkit — prompt engineering, AI-assisted research and writing, AI-driven data analysis, and AI app building, all covered in his Google AI Professional Certificate." },

      { keys: ["language","bangla","english","speak"],
        reply: "He's fluent in English and Bangla." },

      { keys: ["soft skill","leadership","analytical","problem solving"],
        reply: "On the soft-skills side: leadership, analytical thinking and problem solving." },

      { keys: ["who are you","what are you","are you ai","real"],
        reply: "I'm a lightweight assistant built into this site — no external AI calls, just answers drawn from Rahatul's actual resume. Fast, private, and always accurate to what's on the page." }
    ],

    fallback: "I don't have a resume-backed answer for that one — but you can ask Rahatul directly at rahatul.du@gmail.com or +880 1842-760564."
  };

  var chatToggle = document.getElementById('chat-toggle');
  var heroChatBtn = document.getElementById('hero-chat-btn');
  var chatPanel = document.getElementById('chat-panel');
  var chatClose = document.getElementById('chat-close');
  var chatBody = document.getElementById('chat-body');
  var chatInput = document.getElementById('chat-input');
  var chatSend = document.getElementById('chat-send');
  var chatChips = document.getElementById('chat-chips');
  var opened = false;

  var starterChips = ["What are his skills?", "Tell me about his education", "How do I contact him?", "Any certifications?"];

  function addMsg(text, who){
    var div = document.createElement('div');
    div.className = 'msg ' + who;
    div.textContent = text;
    chatBody.appendChild(div);
    chatBody.scrollTop = chatBody.scrollHeight;
    return div;
  }

  function renderChips(){
    chatChips.innerHTML = '';
    starterChips.forEach(function(q){
      var c = document.createElement('button');
      c.type = 'button';
      c.className = 'chip';
      c.textContent = q;
      c.addEventListener('click', function(){ sendMessage(q); });
      chatChips.appendChild(c);
    });
  }

  function findAnswer(text){
    var t = text.toLowerCase();
    for(var i=0;i<KB.answers.length;i++){
      var entry = KB.answers[i];
      for(var j=0;j<entry.keys.length;j++){
        if(t.indexOf(entry.keys[j]) !== -1){ return entry.reply; }
      }
    }
    return KB.fallback;
  }

  function sendMessage(text){
    text = (text || chatInput.value).trim();
    if(!text) return;
    addMsg(text, 'user');
    chatInput.value = '';

    var typing = document.createElement('div');
    typing.className = 'typing';
    typing.innerHTML = '<span></span><span></span><span></span>';
    chatBody.appendChild(typing);
    chatBody.scrollTop = chatBody.scrollHeight;

    var delay = 420 + Math.random()*380;
    setTimeout(function(){
      typing.remove();
      addMsg(findAnswer(text), 'bot');
    }, delay);
  }

  function openChat(){
    chatPanel.classList.add('open');
    chatToggle.setAttribute('aria-expanded','true');
    if(!opened){
      opened = true;
      addMsg("Hi, I'm Rahatul's site assistant. Ask me about his skills, education, certification, projects, or how to get in touch.", 'bot');
      renderChips();
    }
    setTimeout(function(){ chatInput.focus(); }, 150);
  }
  function closeChat(){
    chatPanel.classList.remove('open');
    chatToggle.setAttribute('aria-expanded','false');
  }

  chatToggle.addEventListener('click', function(){
    chatPanel.classList.contains('open') ? closeChat() : openChat();
  });
  heroChatBtn.addEventListener('click', openChat);
  chatClose.addEventListener('click', closeChat);
  chatSend.addEventListener('click', function(){ sendMessage(); });
  chatInput.addEventListener('keydown', function(e){ if(e.key === 'Enter'){ sendMessage(); } });
})();
</script>

</body>
</html>
