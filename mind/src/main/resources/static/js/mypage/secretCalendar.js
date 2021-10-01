$(function() {

	function getDate(date) {
		return date.toLocaleDateString().replace(/\./g, "").split(" ");
	}

	const pad = (str) => str > 10 ? str : '0' + str;

	window.onload = function() {
		const ToDay = new Date();

		const nowMonth = ToDay.getMonth();

		const [y, m] = getDate(new Date(ToDay.setMonth(nowMonth)));

		const lastDay = getDate(new Date(y, m, 0)).pop() * 1;

		const day = new Date([y, m, 1].join("-")).getDay() * 1;

		const maxDay = Math.ceil((day + lastDay) / 7) * 7;

		let html = '';

		for (let i = 1; i <= maxDay; i++) {
			const diff = i - day;
			const d = diff <= lastDay && i > day ? diff : '';
			const tmpClass = !d ? 'background' : '';

			html += `<div class="dateSel_${d} ${tmpClass}">${d}</div>`;
		}

		document.querySelector('.dateSel').innerHTML = html;
		document.querySelector('.date_text').innerText = `${y}년 ${pad(m)}월`;
	}
	
	
	

		

})

