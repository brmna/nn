import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Un color de fondo ligeramente grisaceo como en tu diseño
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                // Acción para volver atrás
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProfileHeader(),
            const SizedBox(height: 24), // Espacio extra
            _buildActionButtons(), // <- NUEVO
            const SizedBox(height: 24), // Espacio extra
            _buildTabs(), // <- NUEVO
            const SizedBox(height: 20),
            _buildServicesList(),
            const SizedBox(height: 40),
            // Aquí irá la lista de servicios en el siguiente paso
          ],
        ),
      ),
    );
  }

  // Extraemos el encabezado en su propio método para mantener el código limpio
  Widget _buildProfileHeader() {
    return Column(
      children: [
        // Stack nos permite poner el ícono de verificado sobre la foto
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            const CircleAvatar(
              radius: 50,
              // Puedes cambiar esta URL por una imagen local usando AssetImage
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(Icons.verified, color: Colors.black, size: 24),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Nombre
        const Text(
          'María González',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            fontFamily: 'Georgia', // Una fuente serif similar a la de tu imagen
          ),
        ),
        const SizedBox(height: 8),

        // Calificación y reseñas
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star_border, size: 20),
            const SizedBox(width: 4),
            const Text(
              '4.9',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(width: 4),
            Text('(128 reseñas)', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
        const SizedBox(height: 8),

        // Ubicación
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined, size: 18, color: Colors.grey[600]),
            const SizedBox(width: 4),
            Text(
              '1.2 km de distancia',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }

  // Método para los botones de Chatear y Llamar
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          // Expanded hace que el botón tome la mitad del ancho
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.black,
                size: 18,
              ),
              label: const Text(
                'Chatear',
                style: TextStyle(color: Colors.black),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(width: 12), // Espacio entre los botones
          // El otro botón toma la otra mitad
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.phone_outlined,
                color: Colors.black,
                size: 18,
              ),
              label: const Text(
                'Llamar',
                style: TextStyle(color: Colors.black),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Método para la barra de Info / Servicios / Portafolio
  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.grey[200], // Fondo gris claro de toda la barra
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            // Pestaña inactiva
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Info',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            // Pestaña ACTIVA ("Servicios")
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Servicios',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Pestaña inactiva
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Portafolio',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método que agrupa todas las tarjetas
  Widget _buildServicesList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _buildServiceCard(
            title: 'Manicura Básica',
            price: '\$250',
            description: 'Limado, cutícula, hidratación y esmaltado',
            duration: '45 min',
          ),
          const SizedBox(height: 16), // Espacio entre tarjetas
          _buildServiceCard(
            title: 'Manicura Francesa',
            price: '\$350',
            description: 'Manicura francesa clásica con acabado perfecto',
            duration: '60 min',
          ),
          const SizedBox(height: 16),
          _buildServiceCard(
            title: 'Uñas de Gel',
            price: '\$500',
            description: 'Aplicación de gel con acabado duradero',
            duration: '90 min',
          ),
          const SizedBox(height: 16),
          _buildServiceCard(
            title: 'Nail Art Personalizado',
            price: '\$700',
            description: 'Diseño personalizado según tus preferencias',
            duration: '120 min',
          ),
        ],
      ),
    );
  }

  // Método REUTILIZABLE para construir una tarjeta individual
  Widget _buildServiceCard({
    required String title,
    required String price,
    required String description,
    required String duration,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // Borde gris muy clarito para enmarcar la tarjeta
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fila superior: Título y Precio
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia', // La misma fuente serif del nombre
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Georgia',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Descripción
          Text(
            description,
            style: TextStyle(color: Colors.grey[500], fontSize: 13),
          ),

          const SizedBox(height: 16),
          // Línea divisoria muy tenue
          Divider(color: Colors.grey.shade100, height: 1, thickness: 1),
          const SizedBox(height: 16),

          // Fila inferior: Duración y Botón Reservar
          Row(
            children: [
              Icon(Icons.access_time, size: 16, color: Colors.grey[500]),
              const SizedBox(width: 6),
              Text(
                duration,
                style: TextStyle(color: Colors.grey[500], fontSize: 13),
              ),

              const Spacer(), // Este widget mágico empuja el botón a la derecha

              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Aquí llamaremos al Bottom Sheet en el Paso 4
                  print('Botón presionado: Reservar $title');
                },
                icon: const Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: Colors.white,
                ),
                label: const Text(
                  'Reservar',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Fondo negro del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  elevation: 0, // Sin sombra para un look plano
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
