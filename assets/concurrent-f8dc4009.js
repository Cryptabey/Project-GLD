import{w as c}from"./writeEffect-e46f04ef.js";import{a}from"./animationSetup-37e43001.js";import"./index-d07ab206.js";const d=(t,s)=>s.text.length-t.text.length,u=t=>t.sort(d)[0].currentNode,l=(t,s)=>{new MutationObserver(i=>{i.forEach(o=>{const n=o.type==="attributes",r=o.target.classList.contains("finished-typing");n&&r&&s()})}).observe(t,{attributes:!0,childList:!0,subtree:!0})},f=(t,s)=>{const{options:e,elements:i}=a(t,s),o=u(i);l(o,()=>e.dispatch("done"));for(const n of i)c(n,e).then(()=>{e.keepCursorOnFinish?n.currentNode!==o?n.currentNode.classList.replace("typing","finished-typing"):e.dispatch("done"):n.currentNode.classList.replace("typing","finished-typing"),typeof e.keepCursorOnFinish=="number"&&setTimeout(()=>{n.currentNode.classList.replace("typing","finished-typing")},e.keepCursorOnFinish)})};export{f as default};
