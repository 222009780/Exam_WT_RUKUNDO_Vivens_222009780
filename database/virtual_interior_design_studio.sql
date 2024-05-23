-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2024 at 08:30 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `virtual_interior_design_studio`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`, `created_at`, `updated_at`) VALUES
(1, 'Sofas', 'Comfortable seating for your living room.', '2024-05-02 14:12:16', '2024-05-02 14:12:16'),
(2, 'Tables', 'sleeping room', '2024-05-02 14:12:16', '2024-05-07 08:35:39'),
(3, 'Lighting', 'Illuminate your space with style.', '2024-05-02 14:12:16', '2024-05-02 14:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `color_id` int(11) NOT NULL,
  `color_name` varchar(50) NOT NULL,
  `color_hex_code` varchar(7) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`color_id`, `color_name`, `color_hex_code`, `created_at`, `updated_at`) VALUES
(1, 'White', '#FFFFFF', '2024-05-02 14:12:15', '2024-05-02 14:12:15'),
(2, 'Brown', '#A52A2A', '2024-05-02 14:12:15', '2024-05-02 14:12:15'),
(3, 'Blue', '#0000FF', '2024-05-02 14:12:15', '2024-05-02 14:12:15');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `message_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`message_id`, `user_id`, `name`, `email`, `subject`, `message`, `created_at`) VALUES
(1, 1, 'John Doe', 'john@gmail.com', 'Question about designs', 'I have some questions regarding the available designs.', '2024-05-02 14:12:16'),
(2, 2, 'Jane Smith', 'jane@gmail.com', 'Feedback on service', 'I wanted to share my feedback about the service provided.', '2024-05-02 14:12:16'),
(3, 3, 'Alice Johnson', 'alice@gmail.com', 'Custom design inquiry', 'I am interested in getting a custom design for my home.', '2024-05-02 14:12:16'),
(4, NULL, 'Jean Pierre NIYONSHUTI', 'jeanpierreniyonshuti71@gmail.com', 'great ', 'hello', '2024-05-08 05:12:34');

-- --------------------------------------------------------

--
-- Table structure for table `designs`
--

CREATE TABLE `designs` (
  `design_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `design_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `designs`
--

INSERT INTO `designs` (`design_id`, `user_id`, `style_id`, `design_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Modern Living Room', 'A sleek and contemporary living space.', '2024-05-02 14:12:16', '2024-05-02 14:12:16'),
(2, 2, 2, 'Rustic Kitchen', 'A cozy kitchen with natural elements.', '2024-05-02 14:12:16', '2024-05-02 14:12:16'),
(3, 3, 3, 'Scandinavian Bedroom', 'A simple and serene sleeping area.', '2024-05-02 14:12:16', '2024-05-02 14:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `furniture`
--

CREATE TABLE `furniture` (
  `furniture_id` int(11) NOT NULL,
  `design_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `furniture_name` varchar(100) NOT NULL,
  `furniture_dimensions` varchar(50) DEFAULT NULL,
  `furniture_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `furniture`
--

INSERT INTO `furniture` (`furniture_id`, `design_id`, `room_id`, `category_id`, `furniture_name`, `furniture_dimensions`, `furniture_description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Sectional Sofa', '10x8 ft', 'Modern design with leather upholstery.', '2024-05-02 14:12:16', '2024-05-02 14:12:16'),
(2, 2, 2, 2, 'Dining Table', '6x4 ft', 'Solid wood construction with seating for six.', '2024-05-02 14:12:16', '2024-05-02 14:12:16'),
(4, 1, 2, 1, 'Dining Table', '12x12', 'Scandinavian-inspired design with clean lines', '2024-05-07 09:39:35', '2024-05-07 09:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `moodboards`
--

CREATE TABLE `moodboards` (
  `moodboard_id` int(11) NOT NULL,
  `design_id` int(11) NOT NULL,
  `moodboard_name` varchar(100) NOT NULL,
  `moodboard_description` text DEFAULT NULL,
  `moodboard_image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `moodboards`
--

INSERT INTO `moodboards` (`moodboard_id`, `design_id`, `moodboard_name`, `moodboard_description`, `moodboard_image_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'Modern Living Room Moodboard', 'Inspiration for furniture and decor.', 'https://example.com/modern-living-room.jpg', '2024-05-02 14:12:16', '2024-05-02 14:12:16'),
(2, 2, 'Rustic Kitchen Moodboard', 'Ideas for rustic elements and colors.', 'https://example.com/rustic-kitchen.jpg', '2024-05-02 14:12:16', '2024-05-02 14:12:16'),
(3, 3, 'Scandinavian Bedroom Moodboard', 'Simple and calming bedroom inspiration.', 'https://example.com/scandinavian-bedroom.jpg', '2024-05-02 14:12:16', '2024-05-02 14:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `design_id` int(11) NOT NULL,
  `order_date` date DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `delivery_address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `design_id`, `order_date`, `total_price`, `payment_status`, `delivery_address`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-05-07', '0.00', '120000', 'Kigali', '2024-05-07 16:57:48', '2024-05-07 16:57:48'),
(2, 1, 2, '2024-05-07', '0.00', '120000', 'Kigali', '2024-05-07 17:00:19', '2024-05-07 17:00:19');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_method`, `payment_date`, `payment_amount`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Mobilephone', '2024-05-07', '100000.00', 'paid', '2024-05-07 17:01:53', '2024-05-07 17:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `profile_picture_url` varchar(255) DEFAULT NULL,
  `social_media_links` text DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`profile_id`, `user_id`, `full_name`, `bio`, `profile_picture_url`, `social_media_links`, `website_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'John Dukuze', 'Interior designer with 10 years of experience.', 'https://john.com/profile.jpg', '{\"twitter\": \"https://twitter.com/johndoe\", \"linkedin\": \"https://linkedin.com/in/johndoe\"}', 'https://johndoe.com', '2024-05-02 14:12:16', '2024-05-02 14:12:16'),
(2, 2, 'Jane Bigwi', 'Passionate about creating beautiful spaces.', 'https://jane.com/profile.jpg', '{\"instagram\": \"https://instagram.com/janesmith\", \"facebook\": \"https://facebook.com/janesmith\"}', 'https://janesmith.com', '2024-05-02 14:12:16', '2024-05-02 14:12:16'),
(3, 3, 'Alice Muton', 'Lover of Scandinavian design and minimalist interiors.', 'https://alice.com/profile.jpg', '{\"pinterest\": \"https://pinterest.com/alicejohnson\", \"linkedin\": \"https://linkedin.com/in/alicejohnson\"}', 'https://alicejohnson.com', '2024-05-02 14:12:16', '2024-05-02 14:12:16'),
(4, 1, 'UMUHOZA Aline', 'dfghj', 'dfty', 'wwww.hta', 'www.web', '2024-05-07 11:10:52', '2024-05-07 11:10:52');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `design_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `room_dimensions` varchar(50) DEFAULT NULL,
  `room_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `design_id`, `color_id`, `room_name`, `room_dimensions`, `room_description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Living Room', '20x15 ft', 'Open space with large windows.', '2024-05-02 14:12:16', '2024-05-02 14:12:16'),
(2, 2, 2, 'Kitchen', '15x10 ft', 'Wooden cabinets and stone countertops.', '2024-05-02 14:12:16', '2024-05-02 14:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `styles`
--

CREATE TABLE `styles` (
  `style_id` int(11) NOT NULL,
  `style_name` varchar(50) NOT NULL,
  `style_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `styles`
--

INSERT INTO `styles` (`style_id`, `style_name`, `style_description`, `created_at`, `updated_at`) VALUES
(1, 'Modern', 'Clean lines and minimalistic design.', '2024-05-02 14:12:15', '2024-05-02 14:12:15'),
(2, 'Rustic', 'Natural materials and earthy tones.', '2024-05-02 14:12:15', '2024-05-02 14:12:15'),
(3, 'Scandinavian', 'Simple and functional with a cozy feel.', '2024-05-02 14:12:15', '2024-05-02 14:12:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Rukundo', 'rukundov@gmail.com', 'Rukundo@2024', '2024-05-02 14:12:15', '2024-05-02 14:12:15'),
(2, 'Jean', 'njean@gmail.com', 'Jean@2024', '2024-05-02 14:12:15', '2024-05-02 14:12:15'),
(3, 'Fabrice', 'hfabrice@gmail.com', 'Fabrice@2024', '2024-05-02 14:12:15', '2024-05-02 14:12:15'),
(4, 'Daniel', 'daniel@gmail.com', '1234', '2024-05-07 17:09:30', '2024-05-07 17:09:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`color_id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `designs`
--
ALTER TABLE `designs`
  ADD PRIMARY KEY (`design_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `style_id` (`style_id`);

--
-- Indexes for table `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`furniture_id`),
  ADD KEY `design_id` (`design_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `moodboards`
--
ALTER TABLE `moodboards`
  ADD PRIMARY KEY (`moodboard_id`),
  ADD KEY `design_id` (`design_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `design_id` (`design_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `design_id` (`design_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Indexes for table `styles`
--
ALTER TABLE `styles`
  ADD PRIMARY KEY (`style_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `designs`
--
ALTER TABLE `designs`
  MODIFY `design_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `furniture`
--
ALTER TABLE `furniture`
  MODIFY `furniture_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `moodboards`
--
ALTER TABLE `moodboards`
  MODIFY `moodboard_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `styles`
--
ALTER TABLE `styles`
  MODIFY `style_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `designs`
--
ALTER TABLE `designs`
  ADD CONSTRAINT `designs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `designs_ibfk_2` FOREIGN KEY (`style_id`) REFERENCES `styles` (`style_id`);

--
-- Constraints for table `furniture`
--
ALTER TABLE `furniture`
  ADD CONSTRAINT `furniture_ibfk_1` FOREIGN KEY (`design_id`) REFERENCES `designs` (`design_id`),
  ADD CONSTRAINT `furniture_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  ADD CONSTRAINT `furniture_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `moodboards`
--
ALTER TABLE `moodboards`
  ADD CONSTRAINT `moodboards_ibfk_1` FOREIGN KEY (`design_id`) REFERENCES `designs` (`design_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`design_id`) REFERENCES `designs` (`design_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`design_id`) REFERENCES `designs` (`design_id`),
  ADD CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `colors` (`color_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
