class Batidora:
    
    def __init__(self, potencia):
        self.potencia = potencia #watts
        self.velocidad = 0 # RPM 
        self.encendida = False
        
    def __str__(self):
        return f"Batidora con {self.potencia}W de potencia, velocidad actual: {self.velocidad} RPM"
        
    def encender(self):
        if self.encendida:
            raise ValueError("La batidora ya está encendida.")
        self.encendida = True
    
    def mezclar(self, nivel_potencia):
        if not self.encendida:
            raise ValueError("La batidora está apagada. Debe encenderla antes de mezclar.")
        
        if nivel_potencia <= 1000:
            raise ValueError("El nivel de potencia de la batidora no puede ser menor a 1000W.")
        
        self.velocidad = nivel_potencia * 15
            
        if self.velocidad > 15000:
            self.velocidad = 15000
        self.encendida = True
        return self.velocidad
    
    
    def calcular_consumo(self,minutos):
        
        if minutos <= 0: 
            raise ValueError("No se puede calcular el consumo si el tiempo de uso es menor o igual a 0.")
        
        horas = minutos / 60
        consumo = (self.potencia * horas) / 1000
        return consumo
    
    def detener_batidora(self):
        self.velocidad = 0
        self.encendida = False
        return self.velocidad