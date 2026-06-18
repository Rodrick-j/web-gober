import Navbar from '@/components/Navbar/Navbar';
import Footer from '@/components/Footer/Footer';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';

export default function PublicLayout({ children }) {
  return (
    <>
      <AnimatedBackground />
      <Navbar />
      {children}
      <Footer />
    </>
  );
}
