import Navbar from '@/components/Navbar/Navbar';
import Footer from '@/components/Footer/Footer';
import AnimatedBackground from '@/components/AnimatedBackground/AnimatedBackground';
import ScrollToTop from '@/components/ScrollToTop/ScrollToTop';

export default function PublicLayout({ children }) {
  return (
    <>
      <AnimatedBackground />
      <Navbar />
      {children}
      <Footer />
      <ScrollToTop />
    </>
  );
}
