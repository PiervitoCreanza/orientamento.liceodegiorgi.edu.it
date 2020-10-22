const toggleBox = (n) => {
    let p = document.getElementById(`toggleBox-${n}`)
    let h = document.getElementById(`toggleBox-${n}-hidden`)
    let c = document.getElementById(`toggleBox-${n}-circle`)
    let i = document.getElementById(`toggleBox-${n}-icon`)

    let isOpen = p.classList.contains("open")
    p.classList.toggle("text-light")
    p.classList.toggle("open")    
    p.classList.toggle("bg-dark")
    h.classList.toggle("fade-out")
    if (isOpen) {
        setTimeout(() => {
            h.classList.toggle("hidden")
            p.classList.toggle("p-4_5")
        }, 400)
    } else {
        h.classList.toggle("hidden")
        p.classList.toggle("p-4_5")
    }
    
    
    c.classList.toggle("dark-circle")
    if (i.src.includes("assets/icns/arrow-down-white.svg")) {
        i.src = "assets/icns/arrow-down.svg"
    } else {
        i.src = "assets/icns/arrow-down-white.svg"
    }
}