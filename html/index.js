garageOpen = false;
resourceName = null;
dropdownDiv = false;
choosedCar = null;
garageVehicles = [];
choosedVehData = [];
currentGarageType = null;
vehicleLogs = [];
useCarImg = false;
window.addEventListener('message', function(event) {
    ed = event.data;
    if (ed.action === "VehicleList") {
		currentGarageType = ed.garageType;
		garageOpen = true;
		resourceName = ed.resourceName;
		choosedCar = null;
		// Button All
		document.getElementById("MDRSBottomDivTopButtonAll").classList.add("MDRSBottomDivTopButtonActive");
		document.getElementById("MDRSBottomDivTopButtonAll").classList.remove("MDRSBottomDivTopButtonInactive");
		// Button Personal
		document.getElementById("MDRSBottomDivTopButtonPersonal").classList.remove("MDRSBottomDivTopButtonActive");
		document.getElementById("MDRSBottomDivTopButtonPersonal").classList.add("MDRSBottomDivTopButtonInactive");
		// Button Job
		document.getElementById("MDRSBottomDivTopButtonJob").classList.remove("MDRSBottomDivTopButtonActive");
		document.getElementById("MDRSBottomDivTopButtonJob").classList.add("MDRSBottomDivTopButtonInactive");
		document.getElementById("bgEffect").style.display = "block";
		document.getElementById("mainDiv").style.display = "flex";
		document.getElementById("MDLeftSide").style.display = "none";
		let label = ed.garageLabel;
		if (label.length > 18) {
			label = label.slice(0, 18) + "...";
		}
		document.getElementById("garageLabel").innerHTML=label;
		document.getElementById("MDRSBottomDivBottom").innerHTML="";
		let parkedVehNum = 0;
		garageVehicles = ed.vehicles;
		useCarImg = ed.useCarImg;
		garageVehicles.forEach(function(vehData, index) {
			// Logs
			vehicleLogs[vehData.plate] = vehData.logs;
			// SVG
			let svg;
			if (useCarImg) {
				svg = `<img src="https://docs.fivem.net/vehicles/${vehData.vehicle}.webp" style="width: 8vw; position: relative; padding-top: 2vw;">`;
			} else {
				svg = `<img src="files/car.png" style="width: 7vw; position: relative; padding-top: 2vw;">`;
			}
			let status;
        	let isDepotPrice1 = false;
			let divStyle = "MDRSBDBCarDivInactive";
			let divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
			if (vehData.state === 0) {
				if (vehData.depotPrice && vehData.depotPrice > 0) {
					isDepotPrice1 = true;
					divStyle = "MDRSBDBCarDivDepot";
					if (vehData.type === "public") {
						status = "Depot";
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
					} else if (vehData.type === "depot") {
						status = "$" + vehData.depotPrice.toFixed(0);
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
					} else {
						status = "Out";
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderOut";
					}
				} else {
					divStyle = "MDRSBDBCarDivOut";
					divStyleBorderBottom = "MDRSBDBCarDivBottomBorderOut";
					status = "Out";
				}
			} else if (vehData.state === 1) {
				if (vehData.depotPrice && vehData.depotPrice > 0) {
					isDepotPrice1 = true;
					if (vehData.type === "depot") {
						status = "$" + vehData.depotPrice.toFixed(0);
						divStyle = "MDRSBDBCarDivDepot";
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
					} else if (vehData.type === "public") {
						status = "Depot";
						divStyle = "MDRSBDBCarDivDepot";
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
					} else {
						status = "Stored";
						divStyle = "MDRSBDBCarDivInactive";
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
						parkedVehNum = parkedVehNum + 1;
					}
				} else {
					status = "Stored";
					divStyle = "MDRSBDBCarDivInactive";
					divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
					parkedVehNum = parkedVehNum + 1;
				}
			} else if (vehData.state === 2) {
				status = "Impound";
			}
			let plateImg = null;
			let plateTextColor = null;
			if (vehData.plateIndex === 0) {
				plateImg = "files/plate1.png";
				plateTextColor = "blue";
			} else if (vehData.plateIndex === 1) {
				plateImg = "files/plate2.png";
				plateTextColor = "yellow;"
			} else if (vehData.plateIndex === 2) {
				plateImg = "files/plate3.png";
				plateTextColor = "yellow";
			} else if (vehData.plateIndex === 3) {
				plateImg = "files/plate4.png";
				plateTextColor = "darkblue";
			} else if (vehData.plateIndex === 4) {
				plateImg = "files/plate1.png";
				plateTextColor = "darkblue";
			} else if (vehData.plateIndex === 5) {
				plateImg = "files/plate6.png";
				plateTextColor = "blue";
			}
			let vehLabel = vehData.vehicleLabel;
			if (vehLabel.length > 15) {
				vehLabel = vehLabel.slice(0, 15) + "...";
			}
			var vehiclesHTML = `
			<div class="MDRSBDBCarDiv ${divStyle}" id="MDRSBDBCarDiv-${vehData.vehicle}" onclick="clFunc('chooseCar', '${vehData.vehicle}', '${vehData.plate}', '${status}', '${vehData.engine}', '${vehData.body}', '${vehData.fuel}', '${vehData.garage}', '${vehData.index}', '${vehData.type}', '${vehData.depotPrice}')">
				<div id="MDRSBDBCarDivTop">
					<div id="MDRSBDBCarDivTopRectangle"></div>
					${svg}
					<div id="MDRSBDBCarDivTopPlate" style="background-image: url(${plateImg}); color: ${plateTextColor};"><h4>${vehData.plate}</h4></div>
				</div>
				<div id="MDRSBDBCarDivBottom"><h4 style="text-transform: capitalize;">${vehLabel}</h4><h4 style="color: #08c098; text-shadow: 0px 0px 20px #08c098; font-size: 0.6vw;">${status}</h4></div>
				<div class="MDRSBDBCarDivBottomBorder ${divStyleBorderBottom}" id="MDRSBDBCarDivBottomBorder-${vehData.vehicle}"></div>
			</div>`;
			appendHtml(document.getElementById("MDRSBottomDivBottom"), vehiclesHTML);
		});
		document.getElementById("parkedVehsH4").innerHTML=parkedVehNum + "/" + ed.vehNum;
	} else if (ed.action === "textUI") {
		if (ed.show) {
			document.getElementById("textUIH4").innerHTML=ed.text;
			$("#textUI").fadeIn().css({bottom: "-10%", position:'absolute', display:'flex'}).animate({bottom: "4%"}, 800, function() {});
		} else {
			$("#textUI").fadeIn().css({bottom: "4%", position:'absolute', display:'none'}).animate({bottom: "-10%"}, 800, function() {});
		}
	}
    document.onkeyup = function(data) {
		if (data.which == 27 && garageOpen) {
			garageOpen = false;
			document.getElementById("bgEffect").style.display = "none";
			document.getElementById("mainDiv").style.display = "none";
			var xhr = new XMLHttpRequest();
			xhr.open("POST", `https://${resourceName}/callback`, true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(JSON.stringify({action: "nuiFocus"}));
		}
	}
})

function clFunc(name1, name2, name3, name4, name5, name6, name7, name8, name9, name10, name11) {
	if (name1 === "dropdown") {
		if (dropdownDiv) {
			dropdownDiv = false;
			document.getElementById("MDLSBottomDivParkingLogs").innerHTML = "";
		} else {
			dropdownDiv = true
			document.getElementById("MDLSBottomDivParkingLogs").innerHTML = "";
			vehicleLogs[choosedVehData.plate].forEach(function(logData, index) {
				var logsHTML = `
				<div id="MDLSBDPLBtn2">
					<h4 style="text-shadow: 0px 0px 20px #08c098; font-size: 0.8vw;">Log Data</h4>
					<h4 style="color: rgb(255, 254, 254, 0.4); font-size: 0.7vw; font-weight: 450;">${logData.type} | Garage: ${logData.garage} | Time: ${logData.time}</h4>
				</div>`;
				appendHtml(document.getElementById("MDLSBottomDivParkingLogs"), logsHTML);
			});
		}
	} else if (name1 === "chooseCar") {
		dropdownDiv = true;
		document.getElementById("MDLSBottomDivParkingLogs").innerHTML="";
		vehicleLogs[name3].forEach(function(logData, index) {
			var logsHTML = `
			<div id="MDLSBDPLBtn2">
				<h4 style="text-shadow: 0px 0px 20px #08c098; font-size: 0.8vw;">Log Data</h4>
				<h4 style="color: rgb(255, 254, 254, 0.4); font-size: 0.7vw; font-weight: 450;">${logData.type} | Garage: ${logData.garage} | Time: ${logData.time}</h4>
			</div>`;
			appendHtml(document.getElementById("MDLSBottomDivParkingLogs"), logsHTML);
		});
		vehicleStats = {
			fuel: Number(name7),
			engine: Number(name5),
			body: Number(name6),
		};
		choosedVehData = {
			vehicle: name2,
			garage: name8,
			index: name9,
			plate: name3,
			type: name10,
			depotPrice: Number(name11),
			stats: vehicleStats,
		};
		document.getElementById("currentVehiclePlate").innerHTML=name3;
		document.getElementById("vehicleStatusH4").innerHTML=`${name4} | Engine: ${Number(name5) / 10}% | Body: ${Number(name6) / 10}%`;
		$("#MDLeftSide").fadeIn().css({left: "-10%", position:'relative', display:'flex'}).animate({left: "0"}, 800, function() {});
		if (choosedCar) {
			// Main Div
			document.getElementById("MDRSBDBCarDiv-" + choosedCar).classList.remove("MDRSBDBCarDivActive");
			document.getElementById("MDRSBDBCarDiv-" + choosedCar).classList.add("MDRSBDBCarDivInactive");
			if (name4 === "Stored") {
				document.getElementById("MDLSBDTakeOutBtn").classList.remove("MDLSBDTakeOutBtnInactive");
				document.getElementById("MDLSBDTakeOutBtn").classList.add("MDLSBDTakeOutBtnActive");
				document.getElementById("MDRSBDBCarDiv-" + name2).classList.remove("MDRSBDBCarDivInactive");
				document.getElementById("MDRSBDBCarDiv-" + name2).classList.add("MDRSBDBCarDivActive");
				// Bottom Border
				document.getElementById("MDRSBDBCarDivBottomBorder-" + choosedCar).classList.remove("MDRSBDBCarDivBottomBorderActive");
				document.getElementById("MDRSBDBCarDivBottomBorder-" + choosedCar).classList.add("MDRSBDBCarDivBottomBorderInactive");
				document.getElementById("MDRSBDBCarDivBottomBorder-" + name2).classList.remove("MDRSBDBCarDivBottomBorderInactive");
				document.getElementById("MDRSBDBCarDivBottomBorder-" + name2).classList.add("MDRSBDBCarDivBottomBorderActive");
				// Button
				document.getElementById("MDLSBDTakeOutBtn").innerHTML="Take Out Vehicle";
				document.getElementById("MDLSBDTakeOutBtn").setAttribute('onclick', 'clFunc("takeOutVehicle")');
			} else {
				document.getElementById("MDLSBDTakeOutBtn").classList.add("MDLSBDTakeOutBtnInactive");
				document.getElementById("MDLSBDTakeOutBtn").classList.remove("MDLSBDTakeOutBtnActive");
				// Button
				document.getElementById("MDLSBDTakeOutBtn").innerHTML="Depot Vehicle";
				document.getElementById("MDLSBDTakeOutBtn").setAttribute('onclick', 'clFunc("takeDepotVehicle")');
			}
		} else {
			if (name4 === "Stored") {
				document.getElementById("MDLSBDTakeOutBtn").classList.remove("MDLSBDTakeOutBtnInactive");
				document.getElementById("MDLSBDTakeOutBtn").classList.add("MDLSBDTakeOutBtnActive");
				// Main Div
				document.getElementById("MDRSBDBCarDiv-" + name2).classList.remove("MDRSBDBCarDivInactive");
				document.getElementById("MDRSBDBCarDiv-" + name2).classList.add("MDRSBDBCarDivActive");
				// Bottom Border
				document.getElementById("MDRSBDBCarDivBottomBorder-" + name2).classList.remove("MDRSBDBCarDivBottomBorderInactive");
				document.getElementById("MDRSBDBCarDivBottomBorder-" + name2).classList.add("MDRSBDBCarDivBottomBorderActive");
				// Button
				document.getElementById("MDLSBDTakeOutBtn").innerHTML="Take Out Vehicle";
				document.getElementById("MDLSBDTakeOutBtn").setAttribute('onclick', 'clFunc("takeOutVehicle")');
			} else {
				document.getElementById("MDLSBDTakeOutBtn").classList.add("MDLSBDTakeOutBtnInactive");
				document.getElementById("MDLSBDTakeOutBtn").classList.remove("MDLSBDTakeOutBtnActive");
				// Button
				document.getElementById("MDLSBDTakeOutBtn").innerHTML="Depot Vehicle";
				document.getElementById("MDLSBDTakeOutBtn").setAttribute('onclick', 'clFunc("takeDepotVehicle")');
			}
		}
		choosedCar = name2;
	} else if (name1 === "closeLeftSide") {
		$("#MDLeftSide").fadeIn().css({left: "0%", position:'relative', display:'flex'}).animate({left: "-10%"}, 800, function() {
			document.getElementById("MDLeftSide").style.display = "none";
		});
	} else if (name1 === "showVehicles") {
		// Button All
		document.getElementById("MDRSBottomDivTopButtonAll").classList.remove("MDRSBottomDivTopButtonActive");
		document.getElementById("MDRSBottomDivTopButtonAll").classList.add("MDRSBottomDivTopButtonInactive");
		// Button Personal
		document.getElementById("MDRSBottomDivTopButtonPersonal").classList.remove("MDRSBottomDivTopButtonActive");
		document.getElementById("MDRSBottomDivTopButtonPersonal").classList.add("MDRSBottomDivTopButtonInactive");
		// Button Job
		document.getElementById("MDRSBottomDivTopButtonJob").classList.remove("MDRSBottomDivTopButtonActive");
		document.getElementById("MDRSBottomDivTopButtonJob").classList.add("MDRSBottomDivTopButtonInactive");
		document.getElementById("MDRSBottomDivTopButton" + name2).classList.remove("MDRSBottomDivTopButtonInactive");
		document.getElementById("MDRSBottomDivTopButton" + name2).classList.add("MDRSBottomDivTopButtonActive");
		// Functions
		document.getElementById("MDLeftSide").style.display = "none";
		document.getElementById("MDRSBottomDivBottom").innerHTML="";
		let parkedVehNum = 0;
		let totalVehNum = 0;
		choosedCar = null;
		if (name2 === "All") {
			garageVehicles.forEach(function(vehData, index) {
				let svg;
				if (useCarImg) {
					svg = `<img src="https://docs.fivem.net/vehicles/${vehData.vehicle}.webp" style="width: 8vw; position: relative; padding-top: 2vw;">`;
				} else {
					svg = `<img src="files/car.png" style="width: 7vw; position: relative; padding-top: 2vw;">`;
				}
				totalVehNum = totalVehNum + 1;
				let status;
				let isDepotPrice2 = false;
				let divStyle = "MDRSBDBCarDivInactive";
				let divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
				if (vehData.state === 0) {
					if (vehData.depotPrice && vehData.depotPrice > 0) {
						isDepotPrice2 = true;
						divStyle = "MDRSBDBCarDivDepot";
						if (vehData.type === "public") {
							status = "Depot";
							divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
						} else if (vehData.type === "depot") {
							status = "$" + vehData.depotPrice.toFixed(0);
							divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
						} else {
							status = "Out";
							divStyleBorderBottom = "MDRSBDBCarDivBottomBorderOut";
						}
					} else {
						divStyle = "MDRSBDBCarDivOut";
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderOut";
						status = "Out";
					}
				} else if (vehData.state === 1) {
					if (vehData.depotPrice && vehData.depotPrice > 0) {
						isDepotPrice2 = true;
						if (vehData.type === "depot") {
							status = "$" + vehData.depotPrice.toFixed(0);
							divStyle = "MDRSBDBCarDivDepot";
							divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
						} else if (vehData.type === "public") {
							status = "Depot";
							divStyle = "MDRSBDBCarDivDepot";
							divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
						} else {
							status = "Stored";
							divStyle = "MDRSBDBCarDivInactive";
							divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
							parkedVehNum = parkedVehNum + 1;
						}
					} else {
						status = "Stored";
						divStyle = "MDRSBDBCarDivInactive";
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
						parkedVehNum = parkedVehNum + 1;
					}
				} else if (vehData.state === 2) {
					status = "Impound";
				}
				let plateImg = null;
				let plateTextColor = null;
				if (vehData.plateIndex === 0) {
					plateImg = "files/plate1.png";
					plateTextColor = "blue";
				} else if (vehData.plateIndex === 1) {
					plateImg = "files/plate2.png";
					plateTextColor = "yellow;"
				} else if (vehData.plateIndex === 2) {
					plateImg = "files/plate3.png";
					plateTextColor = "yellow";
				} else if (vehData.plateIndex === 3) {
					plateImg = "files/plate4.png";
					plateTextColor = "darkblue";
				} else if (vehData.plateIndex === 4) {
					plateImg = "files/plate1.png";
					plateTextColor = "darkblue";
				} else if (vehData.plateIndex === 5) {
					plateImg = "files/plate6.png";
					plateTextColor = "blue";
				}
				let vehLabel = vehData.vehicleLabel;
				if (vehLabel.length > 15) {
					vehLabel = vehLabel.slice(0, 15) + "...";
				}
				var vehiclesHTML = `
				<div class="MDRSBDBCarDiv ${divStyle}" id="MDRSBDBCarDiv-${vehData.vehicle}" onclick="clFunc('chooseCar', '${vehData.vehicle}', '${vehData.plate}', '${status}', '${vehData.engine}', '${vehData.body}', '${vehData.fuel}', '${vehData.garage}', '${vehData.index}', '${vehData.type}', '${vehData.depotPrice}')">
					<div id="MDRSBDBCarDivTop">
						<div id="MDRSBDBCarDivTopRectangle"></div>
						${svg}
						<div id="MDRSBDBCarDivTopPlate" style="background-image: url(${plateImg}); color: ${plateTextColor};"><h4>${vehData.plate}</h4></div>
					</div>
					<div id="MDRSBDBCarDivBottom"><h4 style="text-transform: capitalize;">${vehLabel}</h4><h4 style="color: #08c098; text-shadow: 0px 0px 20px #08c098; font-size: 0.6vw;">${status}</h4></div>
					<div class="MDRSBDBCarDivBottomBorder ${divStyleBorderBottom}" id="MDRSBDBCarDivBottomBorder-${vehData.vehicle}"></div>
				</div>`;
				appendHtml(document.getElementById("MDRSBottomDivBottom"), vehiclesHTML);
			});
			document.getElementById("parkedVehsH4").innerHTML=parkedVehNum + "/" + totalVehNum;
		} else if (name2 === "Personal") {
			garageVehicles.forEach(function(vehData, index) {
				if (vehData.vehClass === 0 || vehData.vehClass === 1 || vehData.vehClass === 2 || vehData.vehClass === 3 || vehData.vehClass === 4 || vehData.vehClass === 5 || vehData.vehClass === 6 || vehData.vehClass === 7 || vehData.vehClass === 8 || vehData.vehClass === 9 || vehData.vehClass === 11 || vehData.vehClass === 12 || vehData.vehClass === 13) {
					let svg;
					if (useCarImg) {
						svg = `<img src="https://docs.fivem.net/vehicles/${vehData.vehicle}.webp" style="width: 8vw; position: relative; padding-top: 2vw;">`;
					} else {
						svg = `<img src="files/car.png" style="width: 7vw; position: relative; padding-top: 2vw;">`;
					}
					totalVehNum = totalVehNum + 1;
					let status;
					let isDepotPrice3 = false;
					let divStyle = "MDRSBDBCarDivInactive";
					let divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
					if (vehData.state === 0) {
						if (vehData.depotPrice && vehData.depotPrice > 0) {
							isDepotPrice3 = true;
							divStyle = "MDRSBDBCarDivDepot";
							if (vehData.type === "public") {
								status = "Depot";
								divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
							} else if (vehData.type === "depot") {
								status = "$" + vehData.depotPrice.toFixed(0);
								divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
							} else {
								status = "Out";
								divStyleBorderBottom = "MDRSBDBCarDivBottomBorderOut";
							}
						} else {
							divStyle = "MDRSBDBCarDivOut";
							divStyleBorderBottom = "MDRSBDBCarDivBottomBorderOut";
							status = "Out";
						}
					} else if (vehData.state === 1) {
						if (vehData.depotPrice && vehData.depotPrice > 0) {
							isDepotPrice3 = true;
							if (vehData.type === "depot") {
								status = "$" + vehData.depotPrice.toFixed(0);
								divStyle = "MDRSBDBCarDivDepot";
								divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
							} else if (vehData.type === "public") {
								status = "Depot";
								divStyle = "MDRSBDBCarDivDepot";
								divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
							} else {
								status = "Stored";
								divStyle = "MDRSBDBCarDivInactive";
								divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
								parkedVehNum = parkedVehNum + 1;
							}
						} else {
							status = "Stored";
							divStyle = "MDRSBDBCarDivInactive";
							divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
							parkedVehNum = parkedVehNum + 1;
						}
					} else if (vehData.state === 2) {
						status = "Impound";
					}
					let plateImg = null;
					let plateTextColor = null;
					if (vehData.plateIndex === 0) {
						plateImg = "files/plate1.png";
						plateTextColor = "blue";
					} else if (vehData.plateIndex === 1) {
						plateImg = "files/plate2.png";
						plateTextColor = "yellow;"
					} else if (vehData.plateIndex === 2) {
						plateImg = "files/plate3.png";
						plateTextColor = "yellow";
					} else if (vehData.plateIndex === 3) {
						plateImg = "files/plate4.png";
						plateTextColor = "darkblue";
					} else if (vehData.plateIndex === 4) {
						plateImg = "files/plate1.png";
						plateTextColor = "darkblue";
					} else if (vehData.plateIndex === 5) {
						plateImg = "files/plate6.png";
						plateTextColor = "blue";
					}
					let vehLabel = vehData.vehicleLabel;
					if (vehLabel.length > 15) {
						vehLabel = vehLabel.slice(0, 15) + "...";
					}
					var vehiclesHTML = `
					<div class="MDRSBDBCarDiv ${divStyle}" id="MDRSBDBCarDiv-${vehData.vehicle}" onclick="clFunc('chooseCar', '${vehData.vehicle}', '${vehData.plate}', '${status}', '${vehData.engine}', '${vehData.body}', '${vehData.fuel}', '${vehData.garage}', '${vehData.index}', '${vehData.type}', '${vehData.depotPrice}')">
						<div id="MDRSBDBCarDivTop">
							<div id="MDRSBDBCarDivTopRectangle"></div>
							${svg}
							<div id="MDRSBDBCarDivTopPlate" style="background-image: url(${plateImg}); color: ${plateTextColor};"><h4>${vehData.plate}</h4></div>
						</div>
						<div id="MDRSBDBCarDivBottom"><h4 style="text-transform: capitalize;">${vehLabel}</h4><h4 style="color: #08c098; text-shadow: 0px 0px 20px #08c098; font-size: 0.6vw;">${status}</h4></div>
						<div class="MDRSBDBCarDivBottomBorder ${divStyleBorderBottom}" id="MDRSBDBCarDivBottomBorder-${vehData.vehicle}"></div>
					</div>`;
					appendHtml(document.getElementById("MDRSBottomDivBottom"), vehiclesHTML);
				}
			});
			document.getElementById("parkedVehsH4").innerHTML=parkedVehNum + "/" + totalVehNum;
		} else if (name2 === "Job") {
			garageVehicles.forEach(function(vehData, index) {
				if (vehData.vehClass === 17 || vehData.vehClass === 18 || vehData.vehClass === 19 || vehData.vehClass === 20 || vehData.vehClass === 10) {
					let svg;
					if (useCarImg) {
						svg = `<img src="https://docs.fivem.net/vehicles/${vehData.vehicle}.webp" style="width: 8vw; position: relative; padding-top: 2vw;">`;
					} else {
						svg = `<img src="files/car.png" style="width: 7vw; position: relative; padding-top: 2vw;">`;
					}
					totalVehNum = totalVehNum + 1;
					let status;
					let isDepotPrice4 = false;
					let divStyle = "MDRSBDBCarDivInactive";
					let divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
					if (vehData.state === 0) {
						if (vehData.depotPrice && vehData.depotPrice > 0) {
							isDepotPrice4 = true;
							divStyle = "MDRSBDBCarDivDepot";
							if (vehData.type === "public") {
								status = "Depot";
								divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
							} else if (vehData.type === "depot") {
								status = "$" + vehData.depotPrice.toFixed(0);
								divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
							} else {
								status = "Out";
								divStyleBorderBottom = "MDRSBDBCarDivBottomBorderOut";
							}
						} else {
							divStyle = "MDRSBDBCarDivOut";
							divStyleBorderBottom = "MDRSBDBCarDivBottomBorderOut";
							status = "Out";
						}
					} else if (vehData.state === 1) {
						if (vehData.depotPrice && vehData.depotPrice > 0) {
							isDepotPrice4 = true;
							if (vehData.type === "depot") {
								status = "$" + vehData.depotPrice.toFixed(0);
								divStyle = "MDRSBDBCarDivDepot";
								divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
							} else if (vehData.type === "public") {
								status = "Depot";
								divStyle = "MDRSBDBCarDivDepot";
								divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
							} else {
								status = "Stored";
								divStyle = "MDRSBDBCarDivInactive";
								divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
								parkedVehNum = parkedVehNum + 1;
							}
						} else {
							status = "Stored";
							divStyle = "MDRSBDBCarDivInactive";
							divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
							parkedVehNum = parkedVehNum + 1;
						}
					} else if (vehData.state === 2) {
						status = "Impound";
					}
					let plateImg = null;
					let plateTextColor = null;
					if (vehData.plateIndex === 0) {
						plateImg = "files/plate1.png";
						plateTextColor = "blue";
					} else if (vehData.plateIndex === 1) {
						plateImg = "files/plate2.png";
						plateTextColor = "yellow;"
					} else if (vehData.plateIndex === 2) {
						plateImg = "files/plate3.png";
						plateTextColor = "yellow";
					} else if (vehData.plateIndex === 3) {
						plateImg = "files/plate4.png";
						plateTextColor = "darkblue";
					} else if (vehData.plateIndex === 4) {
						plateImg = "files/plate1.png";
						plateTextColor = "darkblue";
					} else if (vehData.plateIndex === 5) {
						plateImg = "files/plate6.png";
						plateTextColor = "blue";
					}
					let vehLabel = vehData.vehicleLabel;
					if (vehLabel.length > 15) {
						vehLabel = vehLabel.slice(0, 15) + "...";
					}
					var vehiclesHTML = `
					<div class="MDRSBDBCarDiv ${divStyle}" id="MDRSBDBCarDiv-${vehData.vehicle}" onclick="clFunc('chooseCar', '${vehData.vehicle}', '${vehData.plate}', '${status}', '${vehData.engine}', '${vehData.body}', '${vehData.fuel}', '${vehData.garage}', '${vehData.index}', '${vehData.type}', '${vehData.depotPrice}')">
						<div id="MDRSBDBCarDivTop">
							<div id="MDRSBDBCarDivTopRectangle"></div>
							${svg}
							<div id="MDRSBDBCarDivTopPlate" style="background-image: url(${plateImg}); color: ${plateTextColor};"><h4>${vehData.plate}</h4></div>
						</div>
						<div id="MDRSBDBCarDivBottom"><h4 style="text-transform: capitalize;">${vehLabel}</h4><h4 style="color: #08c098; text-shadow: 0px 0px 20px #08c098; font-size: 0.6vw;">${status}</h4></div>
						<div class="MDRSBDBCarDivBottomBorder ${divStyleBorderBottom}" id="MDRSBDBCarDivBottomBorder-${vehData.vehicle}"></div>
					</div>`;
					appendHtml(document.getElementById("MDRSBottomDivBottom"), vehiclesHTML);
				}
			});
			document.getElementById("parkedVehsH4").innerHTML=parkedVehNum + "/" + totalVehNum;
		}
	} else if (name1 === "takeOutVehicle") {
		if (currentGarageType === "public" || currentGarageType === "gang" || currentGarageType === "job" || currentGarageType === "house") {
			var xhr = new XMLHttpRequest();
			xhr.open("POST", `https://${resourceName}/callback`, true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(JSON.stringify({action: "takeOutVehicle", data: choosedVehData}));
			garageOpen = false;
			document.getElementById("bgEffect").style.display = "none";
			document.getElementById("mainDiv").style.display = "none";
			var xhr = new XMLHttpRequest();
			xhr.open("POST", `https://${resourceName}/callback`, true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(JSON.stringify({action: "nuiFocus"}));
		}
	} else if (name1 === "takeDepotVehicle") {
		if (currentGarageType === "depot") {
			var xhr = new XMLHttpRequest();
			xhr.open("POST", `https://${resourceName}/callback`, true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(JSON.stringify({action: "takeOutDepo", data: choosedVehData}));
			garageOpen = false;
			document.getElementById("bgEffect").style.display = "none";
			document.getElementById("mainDiv").style.display = "none";
			var xhr = new XMLHttpRequest();
			xhr.open("POST", `https://${resourceName}/callback`, true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(JSON.stringify({action: "nuiFocus"}));
		}
	}
}

function appendHtml(el, str) {
	var div = document.createElement('div');
	div.innerHTML = str;
	while (div.children.length > 0) {
		el.appendChild(div.children[0]);
	}
}

const searchInput = document.getElementById("MDRSBottomDivTopInput");
searchInput.addEventListener("input", searchForCar);
function searchForCar(e) {
	if (document.getElementById("MDRSBottomDivTopInput").value === "") {
		clFunc('showVehicles', 'All');
	} else {
		let value = e.target.value;
		let existingVehicle = garageVehicles.find(item => item.vehicleLabel.toLowerCase().includes(value.toLowerCase()));
		let totalVehNum = 0;
		if (existingVehicle) {
			totalVehNum = totalVehNum + 1;
			let parkedVehNum = 0;
			document.getElementById("MDLeftSide").style.display = "none";
			document.getElementById("MDRSBottomDivBottom").innerHTML="";
			let svg;
			if (useCarImg) {
				svg = `<img src="https://docs.fivem.net/vehicles/${existingVehicle.vehicle}.webp" style="width: 8vw; position: relative; padding-top: 2vw;">`;
			} else {
				svg = `<img src="files/car.png" style="width: 7vw; position: relative; padding-top: 2vw;">`;
			}
			let status;
			let isDepotPrice5 = false;
			let divStyle = "MDRSBDBCarDivInactive";
			let divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
			if (existingVehicle.state === 0) {
				if (existingVehicle.depotPrice && existingVehicle.depotPrice > 0) {
					isDepotPrice5 = true;
					divStyle = "MDRSBDBCarDivDepot";
					if (existingVehicle.type === "public") {
						status = "Depot";
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
					} else if (existingVehicle.type === "depot") {
						status = "$" + existingVehicle.depotPrice.toFixed(0);
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
					} else {
						status = "Out";
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderOut";
					}
				} else {
					divStyle = "MDRSBDBCarDivOut";
					divStyleBorderBottom = "MDRSBDBCarDivBottomBorderOut";
					status = "Out";
				}
			} else if (existingVehicle.state === 1) {
				if (existingVehicle.depotPrice && existingVehicle.depotPrice > 0) {
					isDepotPrice5 = true;
					if (existingVehicle.type === "depot") {
						status = "$" + existingVehicle.depotPrice.toFixed(0);
						divStyle = "MDRSBDBCarDivDepot";
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
					} else if (existingVehicle.type === "public") {
						status = "Depot";
						divStyle = "MDRSBDBCarDivDepot";
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderDepot";
					} else {
						status = "Stored";
						divStyle = "MDRSBDBCarDivInactive";
						divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
						parkedVehNum = parkedVehNum + 1;
					}
				} else {
					status = "Stored";
					divStyle = "MDRSBDBCarDivInactive";
					divStyleBorderBottom = "MDRSBDBCarDivBottomBorderInactive";
					parkedVehNum = parkedVehNum + 1;
				}
			} else if (existingVehicle.state === 2) {
				status = "Impound";
			}
			let plateImg = null;
			let plateTextColor = null;
			if (existingVehicle.plateIndex === 0) {
				plateImg = "files/plate1.png";
				plateTextColor = "blue";
			} else if (existingVehicle.plateIndex === 1) {
				plateImg = "files/plate2.png";
				plateTextColor = "yellow;"
			} else if (existingVehicle.plateIndex === 2) {
				plateImg = "files/plate3.png";
				plateTextColor = "yellow";
			} else if (existingVehicle.plateIndex === 3) {
				plateImg = "files/plate4.png";
				plateTextColor = "darkblue";
			} else if (existingVehicle.plateIndex === 4) {
				plateImg = "files/plate1.png";
				plateTextColor = "darkblue";
			} else if (existingVehicle.plateIndex === 5) {
				plateImg = "files/plate6.png";
				plateTextColor = "blue";
			}
			let vehLabel = existingVehicle.vehicleLabel;
			if (vehLabel.length > 15) {
				vehLabel = vehLabel.slice(0, 15) + "...";
			}
			var vehiclesHTML = `
			<div class="MDRSBDBCarDiv ${divStyle}" id="MDRSBDBCarDiv-${existingVehicle.vehicle}" onclick="clFunc('chooseCar', '${existingVehicle.vehicle}', '${existingVehicle.plate}', '${status}', '${existingVehicle.engine}', '${existingVehicle.body}', '${existingVehicle.fuel}', '${existingVehicle.garage}', '${existingVehicle.index}', '${existingVehicle.type}', '${existingVehicle.depotPrice}')">
				<div id="MDRSBDBCarDivTop">
					<div id="MDRSBDBCarDivTopRectangle"></div>
					${svg}
					<div id="MDRSBDBCarDivTopPlate" style="background-image: url(${plateImg}); color: ${plateTextColor};"><h4>${existingVehicle.plate}</h4></div>
				</div>
				<div id="MDRSBDBCarDivBottom"><h4 style="text-transform: capitalize;">${vehLabel}</h4><h4 style="color: #08c098; text-shadow: 0px 0px 20px #08c098; font-size: 0.6vw;">${status}</h4></div>
				<div class="MDRSBDBCarDivBottomBorder ${divStyleBorderBottom}" id="MDRSBDBCarDivBottomBorder-${existingVehicle.vehicle}"></div>
			</div>`;
			appendHtml(document.getElementById("MDRSBottomDivBottom"), vehiclesHTML);
			document.getElementById("parkedVehsH4").innerHTML=parkedVehNum + "/" + totalVehNum;
		}
	}
}